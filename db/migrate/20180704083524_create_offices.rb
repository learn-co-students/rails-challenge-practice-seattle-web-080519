class CreateOffices < ActiveRecord::Migration[5.1]
  def change
    create_table :offices do |t|
      t.references :building, foreign_key: true
      t.references :company, foreign_key: true
      t.integer :floor
      t.timestamps
    end
  end
end
