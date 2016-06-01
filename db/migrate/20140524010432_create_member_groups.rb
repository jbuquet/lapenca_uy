class CreateMemberGroups < ActiveRecord::Migration
  def change
    create_table :member_groups do |t|
      t.string :group_name

      t.timestamps
    end
  end
end
