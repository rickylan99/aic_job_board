# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: ENV['GMAIL_ADDRESS']
  default 'Message-ID' => lambda {
                            "<#{SecureRandom.uuid}@{ActionMailer::Base.smtp_settings[:domain]}>"
                          }

  def forgot_password(user)
    @user = user
    @greeting = 'Hi'
    mail to: user.email, subject: 'Reset Password Instructions'
  end

  def reset_password(user)
    @user = user
    @greeting = 'Hello'
    mail to: user.email,
         subject: 'AIC Access Application Approved. Please Reset Your Password'
  end
end
