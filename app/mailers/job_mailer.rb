class JobMailer < ApplicationMailer
    default from: 'zaalb599@gmail.com'
    default 'Message-ID' => lambda {
                                "<#{SecureRandom.uuid}@{ActionMailer::Base.smtp_settings[:domain]}>"}

    def expired_job(job)
        @job = job
        @firm = Firm.find(job.firm_id)
        mail to: ENV['ADMIN_ADDRESS'], subject: "AIC Access - #{@job.title} Expired"
    end

end
