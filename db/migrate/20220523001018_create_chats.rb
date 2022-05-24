class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :title
      t.belongs_to :request, index: true
      t.references :requester, index: true
      t.references :volunteer, index: true

      t.timestamps
    end
  end
end
