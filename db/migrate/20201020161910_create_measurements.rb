class CreateMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :measurements do |t|
      t.references :user, foreign_key: true
      t.references :metric, foreign_key: true
      t.datetime "created_at", null: false
    end
  end
end
