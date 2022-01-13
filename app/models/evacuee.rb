class Evacuee < ApplicationRecord
  require 'date'
  require 'nkf'

  MIN_BIRTH_DATE = Date.new(1900, 1, 1)
  MAX_BIRTH_DATE = MIN_BIRTH_DATE.days_since(0xFFFF)

  belongs_to :shelter

  validates :first_name,  presence: true, format: { with: /\A[A-Zァ-ロワヲ-ヴー]{1,6}\z/ }
  validates :family_name, presence: true, format: { with: /\A[A-Zァ-ロワヲ-ヴー]{1,6}\z/ }
  validates :birth_date,  presence: true

  validate :check_birth_date_be_past
  validate :check_birth_date_be_in_range

  def encoded_first_name
    NKF.nkf('-W -s -x -Z4 --fb-subchar=0x3013', self.first_name) # UTF-8 -> SJIS
  end

  def encoded_family_name
    NKF.nkf('-W -s -x -Z4 --fb-subchar=0x3013', self.family_name) # UTF-8 -> SJIS
  end

  def encoded_birth_date
    (self.birth_date - MIN_BIRTH_DATE).to_i
  end

  def packet
    ([self.shelter.index, encoded_birth_date % 256, encoded_birth_date / 256] + encoded_first_name.ljust(6, "\0").bytes + encoded_family_name.ljust(6, "\0").bytes + [0]).pack("C*")
  end

  private

  # validation

  def check_birth_date_be_past
    errors.add(:birth_date, ': 過去の日付を指定してください') unless self.birth_date <= Date.today
  end

  def check_birth_date_be_in_range
    errors.add(:birth_date, ': 1900/01/01～2079/06/06の間で指定してください') unless MIN_BIRTH_DATE <= self.birth_date && self.birth_date <= MAX_BIRTH_DATE
  end

  class << self
    def new_from_packet(packet)
      binary = packet.unpack("C*")

      Evacuee.new(
        shelter: Shelter.find_by(index: binary[0]),
        birth_date: MIN_BIRTH_DATE.days_since(binary[1]*256 + binary[2]),
        first_name: NKF.nkf('-w -S --fb-subchar=0x3013', binary[3..8].collect {|c| c != 0 ? c.chr : '' }.join),
        family_name: NKF.nkf('-w -S --fb-subchar=0x3013', binary[9..14].collect {|c| c != 0 ? c.chr : '' }.join)
      )
    end
  end
end
