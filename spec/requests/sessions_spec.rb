require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "Post /create" do
    it "returns http success" do
      post login_path, params: { session: { email: 'user@example.com', password: 'password' } }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/login")
    end
  end


end
