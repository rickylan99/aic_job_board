# frozen_string_literal: true

class User < ApplicationRecord
  has_many :documents, dependent: :destroy

  has_many :job_applications, dependent: :destroy

  has_secure_password
  validates :email, presence: true

  def send_password_forget
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    # This sends an e-mail with a link for the user to reset the password
    UserMailer.forgot_password(self).deliver_now
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    # This sends an e-mail with a link for the user to reset the password
    UserMailer.reset_password(self).deliver_now
  end

  # This generates a random password reset token for the user
  def generate_token(column)
    loop do
      self[column] = SecureRandom.urlsafe_base64
      break unless User.exists?(column => self[column])
    end
  end

  def has_applied(job_id)
    return true if JobApplication.exists?(user_id: id, job_id: job_id)

    false
  end
end
