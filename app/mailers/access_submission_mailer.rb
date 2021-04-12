class AccessSubmissionMailer < ApplicationMailer
    default from: 'zaalb599@gmail.com'
    default 'Message-ID' => lambda {
                                "<#{SecureRandom.uuid}@{ActionMailer::Base.smtp_settings[:domain]}>"}

    def submission_new(submission)
        @submission = submission
        mail to: 'test@gmail.com', subject: "New AIC Access Request Recieved"
    end

end
