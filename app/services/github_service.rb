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
    conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Accept"] = "application/vnd.github.cloak-preview+json"
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get("/search/commits\?q\=user=#{@user}\&sort\=author-date")
    parsed = JSON.parse(response.body, symbolize_names: true)[:items]
  end

  def following_commits #refactor this guy it's too slow!'
    conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Accept"] = "application/vnd.github.cloak-preview+json"
      faraday.adapter Faraday.default_adapter
    end
    commits = []
    following.each do |followed_user|
     response = conn.get("/search/commits\?q\=user=#{followed_user["login"]}\&sort\=author-date")
     commits << JSON.parse(response.body, symbolize_names: true)[:items]
    end
    commits.flatten
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
