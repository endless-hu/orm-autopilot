class AddLanguageToChats < ActiveRecord::Migration[7.1]
  def change
    add_column :chats, :language, :string
    add_column :chats, :summary, :string
  end
end
