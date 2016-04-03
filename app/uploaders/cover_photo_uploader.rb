# encoding: utf-8

class CoverPhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process resize_to_fill: [2000, 500]
  process convert: 'jpg'
  process quality: 70
  def quality(percentage)
    manipulate! do |img|
      img.quality(percentage.to_s)
      img = yield(img) if block_given?
      img
    end
  end

  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{Time.now.to_i}_cover.jpg" if original_filename
  end

end
