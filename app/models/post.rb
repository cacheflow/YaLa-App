class Post < ActiveRecord::Base
	has_many :comments
	has_many :taggings 
	has_many :tags, through: :taggings

	belongs_to :user

	has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"],
	:styles => {
      :original => ['1920x1680>', :jpg, :convert_options => "-auto-orient"],
      :small    => ['100x100#',   :jpg, :convert_options => "-auto-orient"],
      :medium   => ['250x250',    :jpg, :convert_options => "-auto-orient"],
      :large    => ['600x600>',   :jpg, :convert_options => "-auto-orient"]
    }

	def tag_list 
		# sasda
		self.tag.collect do |tag|
			tag.name
		end.join("")
	end

	def tag_list(tags_string)
		tag_names = tags_string.split(",").collect{|name| Tag.find_or_create_by(name: name)}
		self.tags = new_or_found_tags
	end 

end
