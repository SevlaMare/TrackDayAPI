class CreateMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :measurements do |t|
      t.integer :value
      t.references :metric, foreign_key: true
      t.datetime "created_at", null: false
    end
  end
end
