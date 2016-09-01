class CreateOwnerLikes < ActiveRecord::Migration
  def change
    create_table :owner_likes do |t|

      t.timestamps null: false
    end
  end
end
