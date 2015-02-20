class Post < ActiveRecord::Base
  # FriendlyId gem to make post urls include the title instead of just an id number
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :images, dependent: :destroy

  # Using CarrierWave gem to handle image uploads for posts
  mount_uploader :cover_photo, CoverPhotoUploader

  def updated_since_published
    self.updated_at.strftime('%m%d%y').to_i != self.published_at.strftime('%m%d%y').to_i
  end

  def self.create_default
    Post.create(title: "A New Post", post: "Start typing...")
  end

  def publish
    self.update_attributes(draft: false, published_at: Time.now)
  end

  def unpublish
    self.update_attributes(draft: true)
  end

end
