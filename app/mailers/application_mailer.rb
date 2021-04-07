# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'zaalb599@gmail.com' # ENV['GMAIL_ADDRESS']
  layout 'mailer'
end
