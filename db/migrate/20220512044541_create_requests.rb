class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :title
      t.integer :type, default: 0
      t.string :location
      t.string :position
      t.text :description

      t.timestamps
    end
  end
end
