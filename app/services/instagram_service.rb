class InstagramService
  attr_reader :connection,
              :user_token

  def initialize(user_token)
    @user_token = user_token
    @connection = Faraday.new(url: "https://api.instagram.com/v1/") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def current_user_info
    JSON.parse(connection.get("users/self/?access_token=#{user_token}").body, symbolize_names: true)
  end

end
