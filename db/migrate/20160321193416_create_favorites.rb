class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :cat_id
      t.string :thing

      t.timestamps null: false
    end
  end
end
