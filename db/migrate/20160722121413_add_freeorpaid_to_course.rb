class AddFreeorpaidToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :freeorpaid, :string
    add_column :courses, :string, :string
  end
end
