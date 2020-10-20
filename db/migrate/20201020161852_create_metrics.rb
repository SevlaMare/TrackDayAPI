class CreateMetrics < ActiveRecord::Migration[5.2]
  def change
    create_table :metrics do |t|
      t.string :circuit
      t.string :lap_time
      t.string :motorcycle
    end
  end
end
