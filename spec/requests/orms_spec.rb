require 'rails_helper'

RSpec.describe "Orms", type: :request do
  describe "GET /orm" do
    it "returns http success" do
      get "/orms"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/orms/new"
      expect(response).to have_http_status(:success)
    end
  end

end
