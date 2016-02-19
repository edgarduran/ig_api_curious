require 'rails_helper'

describe "the logout process" do
  before { stub_omniauth }
  after { OmniAuth.config.mock_auth[:instagram] = nil }

  it "logs a user out" do
    VCR.use_cassette("logout") do
      visit "/"
      click_link "Login with Instagram"
      expect(current_path).to eq '/profile'

      expect(page).to have_link("Logout")
      click_link "Logout"
      expect(current_path).to eq '/'
      expect(page).to have_content("Login with Instagram")
    end

  end

end
