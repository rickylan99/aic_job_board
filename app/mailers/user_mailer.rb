class UserMailer < ApplicationMailer
    default "Message-ID" => lambda {"<#{SecureRandom.uuid}@{ActionMailer::Base.smtp_settings[:domain]}>"}

    def forgot_password(user)
        @user = user
        @greeting = "Hi"
        mail to: user.email, :subject => 'Reset Password Instructions'
    end

end
