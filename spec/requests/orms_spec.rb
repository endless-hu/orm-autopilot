require 'rails_helper'

RSpec.describe "Orms", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/orms/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/orms/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/orms/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/orms/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
