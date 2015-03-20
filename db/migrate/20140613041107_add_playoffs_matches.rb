class AddPlayoffsMatches < ActiveRecord::Migration
  def change
    (1..8).each { |i|
      if (Match.where(stage: 16, pos_in_stage: i).count <= 0)
        Match.create(stage: 16, pos_in_stage: i)
      end
    }

    (1..4).each { |i|
      if (Match.where(stage: 8, pos_in_stage: i).count <= 0)
        Match.create(stage: 8, pos_in_stage: i)
      end
    }
    (1..2).each { |i|
      if (Match.where(stage: 4, pos_in_stage: i).count <= 0)
        Match.create(stage: 4, pos_in_stage: i)
      end
    }

    (1..2).each { |i|
      if (Match.where(stage: 2, pos_in_stage: i).count <= 0)
        Match.create(stage: 2, pos_in_stage: i)
      end
    }
  end
end
