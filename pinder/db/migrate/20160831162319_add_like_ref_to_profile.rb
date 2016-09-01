class AddLikeRefToProfile < ActiveRecord::Migration
  def change
    add_reference :profiles, :like, index: true, foreign_key: true
  end
end
