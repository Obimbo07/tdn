# application mailer config
class ApplicationMailer < ActionMailer::Base
  default from: 'admin@tdn.com'
  layout 'mailer'
end
