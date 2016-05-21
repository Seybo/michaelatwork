class Post < ActiveRecord::Base

	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true, length: { minimum: 5 }

	has_attached_file :image, styles: { large: "1000x1000>", medium: "600x600>", thumb: "200x200#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
