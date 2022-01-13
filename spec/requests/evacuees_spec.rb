require 'rails_helper'

RSpec.describe "Evacuees", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/evacuees/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/evacuees/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/evacuees/create"
      expect(response).to have_http_status(:success)
    end
  end

end
