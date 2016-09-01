class AddLikesColumnToOwnerLikes < ActiveRecord::Migration
  def change
    add_column :owner_likes, :likes, :integer
  end
end
