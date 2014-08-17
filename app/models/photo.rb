class Photo < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, :styles => { 
  	:medium => "300x300>", :thumb => "100x100>" }
  validates_attachment :image, :attachment_presence => true
  # Validate content type
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # Validate filename
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
end
