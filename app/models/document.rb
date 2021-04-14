# frozen_string_literal: true

class Document < ApplicationRecord
  before_destroy :remove_from_cloudinary
  belongs_to :user
  
  def remove_from_cloudinary
    Cloudinary::Uploader.destroy(self.public_id, type: 'private', invalidate: true)
  end

end
