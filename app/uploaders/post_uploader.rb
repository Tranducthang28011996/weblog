class PostUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  process tags: ["post_image"]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  version :big_image do
    process resize_to_fit: [Settings.image.size, Settings.image.size]
  end

  version :image_post do
    process resize_to_fit: [Settings.image_post.width, Settings.image_post.height]
  end
end
