# spec/features/user_can_search_by_state_spec.rb

require 'rails_helper'

feature "user login" do

  scenario "user submits valid state name" do

#figure out stub for omniauth login, HERE

    visit '/'

    expect(current_path).to eq(root_path)

    VCR.use_cassette("features/see_basic_info") do

      end
    end

end

