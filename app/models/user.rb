class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, :styles => { 
  	:medium => "300x300>", :thumb => "100x100>" }
  #validates :avatar, :attachment_presence => true
  #validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes
  # Validate content type
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # Validate filename
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]
end
