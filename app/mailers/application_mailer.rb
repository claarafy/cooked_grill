class ApplicationMailer < ActionMailer::Base
  default from: ENV["DEFAULT_EMAIL_SENDER_DEVISE"]
  layout 'mailer'
end
