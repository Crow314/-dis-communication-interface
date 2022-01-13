class EvacueesController < ApplicationController
  def new
    @shelter = Shelter.find_by(index: ENV['SHELTER_INDEX'])
    @evacuee = @shelter.evacuees.new
  end

  def create
    @error = []
    @shelter = Shelter.find_by(index: ENV['SHELTER_INDEX'])
    @evacuee = @shelter.evacuees.new(evacuee_params)

    if @evacuee.save
      redirect_to shelter_path(@shelter)
    else
      flash[:error] = '登録に失敗しました'
      @evacuee.errors.full_messages.each { |error| @error << error }
      render 'evacuees/new', status: :bad_request
    end
  end

  private

  # params
  def evacuee_params
    params.require(:evacuee).permit(:birth_date, :first_name, :family_name)
  end
end
