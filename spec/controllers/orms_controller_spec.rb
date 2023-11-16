require 'rails_helper'

RSpec.describe OrmsController, type: :controller do
  render_views
  
  let(:user) { User.create!(email: 'user@example.com', password: 'password123') }
  let(:other_user) { User.create!(email: 'other_user@example.com', password: 'password123') }
  let(:chat) { Chat.create!(code: "test code", feedback: "good", title: 'Chat Title', user_id: user.id) }

  before do
    allow(controller).to receive(:authenticate_user).and_return(true)
    allow(controller).to receive(:authorize_user).and_return(true)
    session[:user_id] = user.id
  end

  describe 'GET #index' do
    it 'assigns @chats' do
      get :index
      expect(assigns(:chats)).to eq([chat])
    end
  end

  describe 'DELETE #destroy' do
  it 'destroys the requested chat' do
    expect(Chat.exists?(chat.id)).to be true

    expect {
      delete :destroy, params: { id: chat.id }
    }.to change(Chat, :count).by(-1)
  end

  it 'redirects to the chats list' do
    delete :destroy, params: { id: chat.id }
    expect(response).to redirect_to("/orms")
  end
end

end
