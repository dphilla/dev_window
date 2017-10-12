class GithubService

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.basic_auth(@user, ENV["GITHUB_TOKEN"]) #how can I do this with oauth token made for each user? (instead of this way?)
      faraday.adapter Faraday.default_adapter
    end
  end

  def basic_info
    response = @conn.get("/users/#{@user}")
    JSON.parse(response.body, symbolize_names: true)
  end


  def starred
    response = @conn.get("users/#{@user}/starred")
    JSON.parse(response.body, symbolize_names: true)
  end

  def following
    response = @conn.get("users/#{@user}/following")
    JSON.parse(response.body, symbolize_names: true)

  end

  def followers
    response = @conn.get("users/#{@user}/followers")
    JSON.parse(response.body, symbolize_names: true)

  end

  def recent_commits
    #try search commits, or add up all the stuff
  end

  def following_commits
    #try search commits, maybe
  end

  def orgs
    response = @conn.get("users/#{@user}/orgs")
    JSON.parse(response.body, symbolize_names: true)

  end

  def repos
    response = @conn.get("users/#{@user}/repos")
    JSON.parse(response.body, symbolize_names: true)

  end

 end
