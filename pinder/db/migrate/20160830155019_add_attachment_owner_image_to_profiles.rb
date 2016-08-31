class AddAttachmentOwnerImageToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :owner_image
    end
  end

  def self.down
    remove_attachment :profiles, :owner_image
  end
end
