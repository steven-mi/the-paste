require 'simplecov'
SimpleCov.start

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'authlogic/test_case'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  # Add more helper methods to be used by all tests here...
end

module ActionDispatch

  class IntegrationTest
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
    include ApplicationHelper
    setup :activate_authlogic 

    def login(user)
      #post user_sessions_url, :params => { :email => user.email, :password => 'password' }
      post sign_in_path, params: { session: { email => user.email, password: 'password' } }
    end
  end
end