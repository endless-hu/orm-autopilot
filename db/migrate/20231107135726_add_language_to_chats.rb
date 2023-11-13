class AddLanguageToChats < ActiveRecord::Migration[7.1]
  def change
    add_column :chats, :language, :string
  end
end
