class Profile < ActiveRecord::Base

  has_attached_file :owner_image, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :owner_image, content_type: /\Aimage\/.*\z/

  has_attached_file :pet_image, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pet_image, content_type: /\Aimage\/.*\z/

end
