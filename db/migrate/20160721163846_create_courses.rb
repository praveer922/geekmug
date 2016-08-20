class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :about
      t.string :type
      t.integer :price
      t.string :location
      t.string :level
      t.string :language
      t.text :syllabus
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
