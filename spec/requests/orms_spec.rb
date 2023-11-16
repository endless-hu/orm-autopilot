require 'rails_helper'

RSpec.describe "Orms", type: :request do
  describe "GET /orms" do
    it "redirects to the user specific orms page" do
      get "/orms"
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/login")
    end
  end

  describe "GET /orms/new" do
    it "redirects to the new user orms page" do
      get "/orms/new"
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/login")
    end
  end

end
