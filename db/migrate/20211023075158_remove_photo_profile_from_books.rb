class RemovePhotoProfileFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :photo_profile, :string
  end
end
