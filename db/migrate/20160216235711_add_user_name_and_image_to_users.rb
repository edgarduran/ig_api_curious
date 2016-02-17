class AddUserNameAndImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string
    add_column :users, :image_url, :string
  end
end
