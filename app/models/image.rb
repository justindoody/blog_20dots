class Image < ApplicationRecord
  belongs_to :post
  mount_uploader :name, PostImagesUploader
end
