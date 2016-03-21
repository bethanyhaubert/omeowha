class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.string :photo
      t.integer :likes

      t.timestamps null: false
    end
  end
end
