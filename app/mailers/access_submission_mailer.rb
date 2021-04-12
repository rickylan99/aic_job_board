class AccessSubmissionMailer < ApplicationMailer
    default from: 'zaalb599@gmail.com'
    default 'Message-ID' => lambda {
                                "<#{SecureRandom.uuid}@{ActionMailer::Base.smtp_settings[:domain]}>"}

    def submission_new(submission)
        @submission = submission
        if ENV['RAILS_ENV'] ||= 'test'
            mail to: 'test@gmail.com', subject: "New AIC Access Request Recieved"
        else  
            mail to: ENV['ADMIN_ADDRESS'], subject: "New AIC Access Request Recieved"
        end   
    end

end
