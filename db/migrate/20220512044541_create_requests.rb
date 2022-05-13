class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :request_type
      t.string :location
      t.decimal :lat
      t.decimal :lgn
      t.text :description
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
