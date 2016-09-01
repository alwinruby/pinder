class AddOwnerLikesRefToProfiles < ActiveRecord::Migration
  def change
    add_reference :owner_likes, :profile, index: true, foreign_key: true
  end
end
