class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hashed_password, :string
    add_column :users, :salt, :string
    add_column :users, :email, :string
  end
end
