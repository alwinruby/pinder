class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :owner_name
      t.string :owner_likes
      t.string :owner_dislikes
      t.integer :owner_age
      t.string :pet_name
      t.integer :pet_age
      t.string :pet_likes
      t.string :pet_dislikes
      t.string :pet_species

      t.timestamps null: false
    end
  end
end
