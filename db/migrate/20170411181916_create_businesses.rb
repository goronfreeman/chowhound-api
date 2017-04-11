class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :website

      t.timestamps
    end
  end
end
