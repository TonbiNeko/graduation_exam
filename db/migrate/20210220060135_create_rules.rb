class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.time :start_at
      t.time :end_at
      t.text :separation
      t.text :amount
      t.text :comment
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
