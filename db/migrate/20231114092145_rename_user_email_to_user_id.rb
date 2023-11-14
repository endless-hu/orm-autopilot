class RenameUserEmailToUserId < ActiveRecord::Migration[7.1]
  def change
    rename_column :chats, :user_email, :user_id
  end
end
