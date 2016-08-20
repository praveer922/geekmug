class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.datetime :start_date
      t.integer :price

      t.timestamps null: false
    end
  end
end
