class CreateChickens < ActiveRecord::Migration[7.0]
  def change
    create_table :chickens do |t|
      t.string :circuit_name
      t.string :circuit_avatar
      t.references :tournament, null: false, foreign_key: true

      t.timestamps
    end
  end
end
