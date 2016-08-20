class RemoveTypeFromCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :type, :string
    remove_column :courses, :string, :string
  end
end
