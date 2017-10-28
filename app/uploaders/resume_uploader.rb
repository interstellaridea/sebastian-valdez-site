class ResumeUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  # Choose what kind of storage to use for this uploader:
  storage :aws
  # storage :fog


  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  version :jpg_preview do
    
    process :convert_to_image
    
    def full_filename(for_file)
      super(for_file).chomp(File.extname(super(for_file))) + '.jpg'
    end

    def convert_to_image
      image = MiniMagick::Image.open(self.current_path)
      image.format "jpg"
      image.resize "500x500"
      image.write current_path
    end
  end

   def set_content_type_jpg(*args)
    self.file.instance_variable_set(:@content_type, "image/jpg")
  end


  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png pdf)
  end

end
