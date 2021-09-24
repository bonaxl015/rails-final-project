class AddProfilePicToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :profile_pic, :string, default: nil
  end
end
