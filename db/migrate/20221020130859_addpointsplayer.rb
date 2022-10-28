class Addpointsplayer < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :pointsdemi, :integer
    add_column :players, :pointsfinal, :integer
    add_column :players, :pointstotal, :integer
  end
end
