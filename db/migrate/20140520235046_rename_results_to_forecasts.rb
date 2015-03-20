class RenameResultsToForecasts < ActiveRecord::Migration
  def change
    drop_table :forecasts
    rename_table :results, :forecasts
    add_column :forecasts, :member_id, :integer
  end
end
