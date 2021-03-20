class DocumentUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  make_private
end
