class CreateTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :description
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
