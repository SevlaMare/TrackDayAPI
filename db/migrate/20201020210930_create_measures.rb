class CreateMeasures < ActiveRecord::Migration[5.2]
  def change
    create_table :measures do |t|
      t.string :name
      t.references :measurement, foreign_key: true
    end
  end
end
