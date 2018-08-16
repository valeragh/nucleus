class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fill: [50, 50]
  end

  version :category do
    process :category_image
  end

  def category_image
    if model.class.to_s == "Category" || model.class.to_s == "PodCategory" || model.class.to_s == "Image"
      resize_to_fill(500, 500)
    end
  end

  version :magazine do
    process :magazine_image
  end

  def magazine_image
    if model.class.to_s == "Contact" || model.class.to_s == "Post" || model.class.to_s == "Image"
      resize_to_fill(600, 400)
    end
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
