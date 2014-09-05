class Tag < ActiveRecord::Base
	has_many :tag_photo_relationships, dependent: :destroy
	has_many :photos, :through => :tag_photo_relationships


	validates :key, presence: true, length: { in: 5..25 }
	validates :value, presence: true, length: { in: 5..25 }
end
