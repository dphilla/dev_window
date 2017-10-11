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


  def initialize(response = {})
    @name                  = response[:name]
    @image                 = response[:avatar_url]
    @starred_repos         = response
    @following             = response
    @followers             = response
    @recent_commits        = response
    @following_commits     = response
    @orgs                  = response
    @repos                 = response
  end


   def self.info(user)
     response  = GithubService.new(user)
     response = response.basic_info
     UserInfo.new(response)
   end



end
