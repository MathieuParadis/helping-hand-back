class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.decimal :lat, precision: 6, scale: 3
      t.decimal :lng, precision: 6, scale: 3
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
