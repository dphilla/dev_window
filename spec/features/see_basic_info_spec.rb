# spec/features/user_can_search_by_state_spec.rb

require 'rails_helper'

feature "user login" do

  scenario "user submits valid state name" do

#figure out stub for omniauth login, HERE

    visit '/'

    expect(current_path).to eq(root_path)

    VCR.use_cassette("features/see_basic_info") do
      # Then my path should be "/search" with "state=CO" in the params

      # And I should see a message "7 results"

        expect(page).to have_content("Login_in")

      # And i should see name, role, party, district
      within(first(".member")) do
        expect(page).to have_css(".name")
        expect(page).to have_css(".role")
        expect(page).to have_css(".party")
        expect(page).to have_css(".district")
      end
    end
  end

end

