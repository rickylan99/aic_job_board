# frozen_string_literal: true

class ApplicationDocument < ApplicationRecord
  before_destroy :remove_from_cloudinary
  belongs_to :job_application

  def remove_from_cloudinary
    Cloudinary::Uploader.destroy(self.public_id, type: 'private', invalidate: true)
  end

end
