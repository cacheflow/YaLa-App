class Post < ActiveRecord::Base
	has_many :comments
	has_many :taggins 
	has_many :tags, through: :taggins
	has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]


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
end
