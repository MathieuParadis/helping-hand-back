class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.decimal :lat, precision: 7, scale: 5
      t.decimal :lng, precision: 8, scale: 5
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
