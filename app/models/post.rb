class Post < ActiveRecord::Base
  # FriendlyId gem to make post urls include the title instead of just an id number
  extend FriendlyId
  friendly_id :title, :use => :slugged

  # Using CarrierWave gem to handle image uploads for posts
  mount_uploader :cover_photo, CoverPhotoUploader
end
