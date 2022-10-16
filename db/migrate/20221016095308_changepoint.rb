class Changepoint < ActiveRecord::Migration[7.0]
  def change
    change_column :players, :points, 'integer USING CAST(points AS integer)'
  end
end
