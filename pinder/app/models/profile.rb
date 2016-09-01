class Profile < ActiveRecord::Base

  has_attached_file :owner_image, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :owner_image, content_type: /\Aimage\/.*\z/
  validates :owner_name, length: { minimum: 1 }, presence: true
  validates_numericality_of :owner_age, is_greater_than: 18
  validates :owner_likes, length: { minimum: 1 }, presence: true
  validates :owner_dislikes, length: { minimum: 1 }, presence: true

  has_attached_file :pet_image, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pet_image, content_type: /\Aimage\/.*\z/
  validates :pet_name, length: { minimum: 1 }, presence: true
  validates_numericality_of :pet_age, is_greater_than: 1
  validates :pet_likes, length: { minimum: 1 }, presence: true
  validates :pet_dislikes, length: { minimum: 1 }, presence: true

  belongs_to :user
  has_many :likes

end
