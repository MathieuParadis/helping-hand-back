class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :request_type
      t.string :location
      t.decimal :lat, precision: 5, scale: 2
      t.decimal :lng, precision: 5, scale: 2
      t.text :description
      t.string :status, :default => "in progress"
      t.integer :count, :default => 0
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
