require 'rails_helper'

describe GithubService do
  context 'class methods' do
    context "initialize" do
      it "exists" do
        #expect(GithubService.new).to be_a GithubService
      end
    end
  end

  context "instance methods" do
    context "#returns parsed json" do
      #let(:basic_info)  { basic_info}

      it "returns a hashe with proper structure" do
        vcr.use_cassette("basic_info") do

          #expect(basic_info).to be_a(hash)
          #expect(basic_info[:name]).to eq("something")

        end
      end
    end
  end
end


