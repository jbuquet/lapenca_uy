class CreateArenas < ActiveRecord::Migration
  def change
    create_table :arenas do |t|
      t.string :name
      t.string :city
      t.integer :capacity

      t.timestamps
    end
  end
end
