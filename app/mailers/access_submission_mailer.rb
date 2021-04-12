# frozen_string_literal: true

    def submission_new(submission)
        @submission = submission
        if ENV['RAILS_ENV'] ||= 'test'
            mail to: 'test@gmail.com', subject: "New AIC Access Request Recieved"
        else  
            mail to: ENV['ADMIN_ADDRESS'], subject: "New AIC Access Request Recieved"
        end   
    end

  def submission_new(submission)
    @submission = submission
    mail to: ENV['ADMIN_ADDRESS'], subject: 'New AIC Access Request Recieved'
  end
end
