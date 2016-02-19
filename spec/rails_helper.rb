# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'vcr'
require 'capybara/rspec'

ActiveRecord::Migration.maintain_test_schema!

def stub_omniauth
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
  "provider"=>"instagram",
  "uid"=> ENV['MOCK_UID'],
  "info"=>
     {
       "nickname"=>"edgarduran303",
       "name"=>"Edgar Duran",
       "email"=>nil,
       "image"=>"https://scontent.cdninstagram.com/t51.2885-19/11375236_1453807714913882_969507463_a.jpg",
       "bio"=>"",
       "website"=>""
     },
        "credentials"=>
          {
            "token"=> ENV['MOCK_TOKEN'],
            "expires"=>false
          },
            "extra"=>
              {
                "raw_info"=>
                  {
                    "username"=>"edgarduran303",
                    "bio"=>"",
                    "website"=>"",
                    "profile_picture"=>"https://scontent.cdninstagram.com/t51.2885-19/11375236_1453807714913882_969507463_a.jpg",
                    "full_name"=>"Edgar Duran",
                    "id"=>"2126510311"
                  }
              }
    })
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
end
