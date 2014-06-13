class AddStageAndPosInStageColumnsToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :stage, :integer
    add_column :matches, :pos_in_stage, :integer

    Match.all.each { |match|
      match.stage = '32'
      match.pos_in_stage = ((match.id - 1) % 6) + 1

      match.save
    }
  end
end
