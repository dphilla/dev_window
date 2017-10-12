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
    @name                  = service(user).basic_info[:name]
    @image                 = service(user).basic_info[:avatar_url]
    @starred_repos         = service(user).starred
    @following             = service(user).following
    @followers             = service(user).followers
    @recent_commits        = service(user).recent_commits
    @following_commits     = service(user).following_commits
    @orgs                  = service(user).orgs
    @repos                 = service(user).repos
  end




   def service(user)
      GithubService.new(user)
   end




end
