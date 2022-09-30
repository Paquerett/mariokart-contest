class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :nickname
      t.string :avatar
      t.string :points
      t.references :tournament, null: false, foreign_key: true
      t.references :chicken, null: false, foreign_key: true

      t.timestamps
    end
  end
end
