require 'rails_helper'

RSpec.feature "URL Shortener", :type => :feature do
  scenario "filling out the form" do
    visit "/"

    within('h1') do
      expect(page).to have_content 'URL Shortener'
    end

    within('.form') do
      expect(page).to have_content 'Paste an URL here to shorten it.'
      expect(page).to have_selector 'button'
      expect(page).to have_selector 'input'

      fill_in 'url_input', with: 'http://www.google.com/this_is-a-test/?params=bla'
      click_button 'Shorten'
    end

    within('.result') do
      expect(page).to have_content 'Original'
      expect(page).to have_content 'Short'
      expect(page).to have_selector 'a'
    end
  end
end