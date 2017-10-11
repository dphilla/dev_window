class GithubService

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def basic_info
    response = @conn.get("/users/#{@user}")
    JSON.parse(response.body, symbolize_names: true)
  end



end
