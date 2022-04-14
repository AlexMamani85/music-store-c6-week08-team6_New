class CreateDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :details do |t|
      t.integer :quantity
      t.references :order, null: false, foreign_key: true
      t.references :album, null: false, foreign_key: true

      t.timestamps
    end
  end
end
