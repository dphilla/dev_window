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
    @user                  = user
    @name                  = service(user).basic_info[:name]
    @image                 = service(user).basic_info[:avatar_url]
    @starred_repos         = service(user).starred
    @following             = service(user).following
    @followers             = service(user).followers
    #@recent_commits        = service(user).recent_commits
    @following_commits     = nil
    @orgs                  = service(user).orgs
    @repos                 = service(user).repos
  end




   def service(user)
      GithubService.new(user)
   end


   def following_commits
     all_commits = service(@user).following_commits
     commit_messages = []
     all_commits.each do |commit|
      commit_messages << commit[:commit][:message]
     end
     @following_commits = commit_messages
   end
end
