class AddMemberGroupToMember < ActiveRecord::Migration
  def change
    add_column :members, :member_group_id, :integer
  end
end
