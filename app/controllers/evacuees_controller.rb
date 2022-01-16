class EvacueesController < ApplicationController
  require 'net/http'

  skip_forgery_protection only: :register

  def new
    @shelter = Shelter.find_by(index: ENV['SHELTER_INDEX'])
    @evacuee = @shelter.evacuees.new
  end

  def create
    @error = []
    @shelter = Shelter.find_by(index: ENV['SHELTER_INDEX'])
    @evacuee = @shelter.evacuees.new(evacuee_params)

    if @evacuee.save
      transmit_to_gateway @evacuee.packet

      redirect_to shelter_path(@shelter)
    else
      flash[:error] = '登録に失敗しました'
      @evacuee.errors.full_messages.each { |error| @error << error }
      render 'evacuees/new', status: :bad_request
    end
  end

  def register
    str = params[:data]
    if /\A[\da-fA-F]+\z/ !~ str || str.length % 2 == 1
      head :bad_request
      return
    end

    packet = str.scan(/../).map{ |b| b.to_i(16) }
    evacuee = Evacuee.new_from_packet(packet)

    if evacuee.save
      head :no_content
    else
      head :bad_request
    end
  end

  private

  def transmit_to_gateway(packet)
    uri = URI.parse(ENV['GATEWAY_URL'])
    params = { data: packet.map{ |b| "%02X" % b }.join, service: ENV['GATEWAY_SERVICE'] }

    Net::HTTP.post_form(uri, params)
  end

  # params
  def evacuee_params
    params.require(:evacuee).permit(:birth_date, :first_name, :family_name)
  end
end
