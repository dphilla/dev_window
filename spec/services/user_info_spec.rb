require 'rails_helper'

describe UserInfo do

  context 'class methods' do
    context "initialize" do
      it "exists" do
        #expect(UserInfo.new).to be_a UserInfo
      end
    end
  end

  context "instance methods" do
    context "checking commits" do
      #let(:commits)  {  }

      it "#recent_commits" do
        #VCR.use_cassette("recent_commits") do
            #my recent commits assertations
        end
      end
      it "#following_commits" do
        VCR.use_cassette("following_commits") do
            #my followers recent commits assertations
        end
      end
    end
  end

end

