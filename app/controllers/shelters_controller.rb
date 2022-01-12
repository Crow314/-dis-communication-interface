class SheltersController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @shelters = pagy(Shelter.all.order(index: 'ASC'), items: 16)
  rescue Pagy::OverflowError, Pagy::VariableError
    redirect_to shelters_path
  end

  def show
  end
end
