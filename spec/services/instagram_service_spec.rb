require 'rails_helper'

describe "InstagramService" do
  it "works" do
    expect(1 + 1).to eq(2)
  end

  context "#images" do
    it "returns images" do
      VCR.use_cassette("instagram_service") do
        service     = InstagramService.new(ENV['MOCK_TOKEN'], ENV['MOCK_UID'])
        images_raw  = service.user_images
        images      = images_raw[:data]

        expect(images.count).to eq(7)
      end
    end
  end

end
