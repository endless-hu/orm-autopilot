class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.string :code
      t.string :feedback

      t.timestamps
    end
    Chat.create(code: 'test code', feedback: 'test feedback')
  end
end
