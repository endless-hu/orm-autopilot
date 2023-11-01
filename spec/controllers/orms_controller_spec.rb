require 'rails_helper'

RSpec.describe OrmsController, type: :controller do
  render_views

  let(:valid_code) { "Sample ORM code" }
  let(:valid_feedback) { "It is correct" }

  describe "GET #index" do
    it "assigns all chats as @chats" do
      chat = Chat.create! code: valid_code, feedback: valid_feedback
      get :index
      expect(assigns(:chats)).to eq([chat])
    end
  end

  describe "POST #create" do
    context "with valid params" do
        it "creates a new Chat" do
            expect {
                post :create, params: { code: valid_code }
            }.to change(Chat, :count).by(1)
        end

        it "redirects to the created chat" do
            post :create, params: { code: valid_code }
            expect(response).to redirect_to(orm_path(Chat.last))
        end
    end
  end

  describe "DELETE #destroy" do
    let!(:chat) { Chat.create! code: valid_code, feedback: valid_feedback }

    it "destroys the requested chat" do
      expect {
        delete :destroy, params: { id: chat.to_param }
      }.to change(Chat, :count).by(-1)
    end

    it "redirects to the chats list" do
      delete :destroy, params: { id: chat.to_param }
      expect(response).to redirect_to(orms_path)
    end
  end
end
