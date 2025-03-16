class ApplicationMailer < ActionMailer::Base
  default from: ENV['NOTIFICATION_FROM_EMAIL']
  layout 'mailer'
end
