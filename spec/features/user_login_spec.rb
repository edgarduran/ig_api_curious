require 'rails_helper'


RSpec.feature "Login", :type => :feature do

  scenario "logs in a user" do
    VCR.use_cassette("login") do
      stub_omniauth
      visit "/"
      assert_equal 200, page.status_code
      click_link "Login with Instagram"
      assert_equal "/profile", current_path

      expect(page).to have_content("edgarduran303")
      expect(page).to have_content("Edgar Duran")
      expect(page).to have_link("Logout")
    end
  end

end
