class AddTitleToChats < ActiveRecord::Migration[7.1]
  def change
    add_column :chats, :title, :string
    add_column :chats, :user_id, :string
    add_column :chats, :last_updated, :datetime
  end
end
