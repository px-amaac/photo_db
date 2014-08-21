class CreateTagPhotoRelationships < ActiveRecord::Migration
  def change
    create_table :tag_photo_relationships do |t|
      t.references :tag, index: true
      t.references :photo, index: true

      t.timestamps
    end
  end
end
