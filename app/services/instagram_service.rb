class InstagramService
  attr_reader :connection,
              :user_token,
              :user_id

  def initialize(user_token, user_id)
    @user_token = user_token
    @user_id    = user_id
    @connection = Faraday.new(url: "https://api.instagram.com/v1/") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def current_user_info
    binding.pry
    parse_json(connection.get("users/self/?access_token=#{user_token}"))
  end

  def user_images
    parse_json(connection.get("users/#{user_id}/media/recent/?access_token=#{user_token}"))
  end

  def liked
    # GET /users/self/media/liked
  end

  def users_search
    # GET /users/search?q=jack&access_token=ACCESS-TOKEN
  end

  def following
    # GET users/self/follows?access_token=ACCESS-TOKEN
  end

  def followers
    # GET users/self/followed-by?access_token=ACCESS-TOKEN
  end

  def comments
    # GET media/{media-id}}/comments?access_token=ACCESS-TOKEN
  end

  def liked_post
    # GET media/{media-id}/likes?access_token=ACCESS-TOKEN
  end

  private

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
