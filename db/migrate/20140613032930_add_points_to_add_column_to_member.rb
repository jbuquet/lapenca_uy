class AddPointsToAddColumnToMember < ActiveRecord::Migration
  def change
    add_column :members, :points_to_add, :integer, default: 0
  end
end
