class AddDefaultPhotoToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :photo, "https://cdn-icons-png.flaticon.com/512/21/21104.png"
  end
end
