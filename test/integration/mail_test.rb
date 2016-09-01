require 'test_helper'

class MailTest < ActiveSupport::IntegrationCase

  test 'mail sent' do
    user = User.create!(:email => 'foo@foo.com', :password => 'wow')
    UserMailer.welcome_email(user).deliver
    assert_equal 1, counters.fetch("rails.mail.sent", tags: { mailer: "UserMailer" })
  end

end
