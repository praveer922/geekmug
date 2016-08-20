class AddScheduleToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :schedule, :string
  end
end
