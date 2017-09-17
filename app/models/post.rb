# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  title              :string
#  body               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  published_at       :datetime
#  slug               :string
#  category_id        :integer
#
# Indexes
#
#  index_posts_on_published_at  (published_at)
#  index_posts_on_slug          (slug) UNIQUE
#

class Post < ActiveRecord::Base

  belongs_to :category

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 5 }
  validates :published_at, presence: true
  validates :category_id, presence: true

  has_attached_file :image, styles: { large: "1000x1000>", medium: "600x600>", thumb: "200x200#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

end
