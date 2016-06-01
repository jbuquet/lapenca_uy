class RemoveCoachColumnFromTeamsTable < ActiveRecord::Migration
  def change
    remove_column :teams, :coach
  end
end
