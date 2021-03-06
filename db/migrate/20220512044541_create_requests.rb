class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :request_type
      t.string :location
      t.decimal :lat, precision: 7, scale: 5
      t.decimal :lng, precision: 8, scale: 5
      t.text :description
      t.string :status, :default => "in progress"
      t.integer :count, :default => 0
      t.integer :expiry_date
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
