class CreateMetrics < ActiveRecord::Migration[5.2]
  def change
    create_table :metrics do |t|
      t.references :user, foreign_key: true
      t.references :measurement, foreign_key: true
    end
  end
end
