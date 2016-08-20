class AddOnlineorphysicalToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :onlineorphysical, :string
  end
end
