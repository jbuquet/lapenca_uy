class RemoveArenasTable < ActiveRecord::Migration
  def change
    drop_table :arenas
  end
end
