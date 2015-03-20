class AddGroupColumnToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :group, :string
  end
end
