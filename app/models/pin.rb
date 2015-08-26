class Pin < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :image,styles: {medium: "300x300>" ,thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  validates :title, presence: true
  validates :description, presence: true
end
