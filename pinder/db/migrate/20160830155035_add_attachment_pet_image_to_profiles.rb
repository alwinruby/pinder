class AddAttachmentPetImageToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :pet_image
    end
  end

  def self.down
    remove_attachment :profiles, :pet_image
  end
end
