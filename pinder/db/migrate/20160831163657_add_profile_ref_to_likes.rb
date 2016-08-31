class AddProfileRefToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :profile, index: true, foreign_key: true
  end
end
