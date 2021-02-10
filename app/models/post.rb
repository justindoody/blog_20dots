class Post < ApplicationRecord
  # FriendlyId gem to make post urls include the title instead of just an id number
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :images, dependent: :destroy

  # Using CarrierWave gem to handle image uploads for posts
  mount_uploader :cover_photo, CoverPhotoUploader

  class << self
    def create_default
      create(title: "A New Post", post: "Start typing...")
    end
  end

  # Check if updated since published, excluding updates on day of publishing
  def updated_since_published?
    updated_at.strftime('%m%d%y').to_i != published_at.strftime('%m%d%y').to_i
  end

  def publish
    update(draft: false, published_at: Time.now)
  end

  def unpublish
    update(draft: true)
  end

end
