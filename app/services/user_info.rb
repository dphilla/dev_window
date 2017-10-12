class UserInfo

  attr_reader :name,
              :image,
              :starred_repos,
              :following,
              :followers,
              :recent_commits,
              :following_commits,
              :orgs,
              :repos


  def initialize(user)
    @name                  = service.new(user).basic_info[:name]
    @image                 = service.new(user).basic_info[:avatar_url]
    @starred_repos         = service.new(user).starred
    @following             = service.new(user).following
    @followers             = service.new(user).followers
    #@recent_commits        = service.new(user).recent_commits
    #@following_commits     = service.new(user).following_commits
    @orgs                  = service.new(user).orgs
    @repos                 = service.new(user).repos
  end




   def service(user)
      GithubService.new(user)
   end




end
