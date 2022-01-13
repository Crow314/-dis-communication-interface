require 'rails_helper'

RSpec.describe "Shelters", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/shelters/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/shelters/show"
      expect(response).to have_http_status(:success)
    end
  end

end
