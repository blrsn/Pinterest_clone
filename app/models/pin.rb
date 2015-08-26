class Pin < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments
  
  has_attached_file :image,styles: {medium: "300x300>" ,thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  validates :title, presence: true
  validates :description, presence: true
end
