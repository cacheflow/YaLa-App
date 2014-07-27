class AddImageContentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_file_name, :string
    add_column :posts, :image_content_type, :string
    add_column :posts, :image_file_size, :integer
  end
end
