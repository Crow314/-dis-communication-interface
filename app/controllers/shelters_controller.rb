class SheltersController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @shelters = pagy(Shelter.all.order(index: 'ASC'), items: 16)
  rescue Pagy::OverflowError, Pagy::VariableError
    redirect_to shelters_path
  end

  def show
    @shelter = Shelter.find(params[:id])
    @pagy, @evacuees = pagy(@shelter.evacuees.order(birth_date: 'ASC'), items: 16)
  rescue ActiveRecord::RecordNotFound
    redirect_to shelters_path
  end
end
