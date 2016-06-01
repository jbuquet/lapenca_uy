class AddStageAndPosInStageColumnsToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :stage, :integer
    add_column :matches, :pos_in_stage, :integer
  end
end
