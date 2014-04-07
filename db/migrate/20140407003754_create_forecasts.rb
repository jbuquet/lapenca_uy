class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.integer :member_id

      t.timestamps
    end
  end
end
