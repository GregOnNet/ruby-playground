require 'rspec'
require 'capybara'
require 'capybara/dsl'

Capybara.default_driver = :selenium
Capybara.app_host = 'http://www.youtube.com'

RSpec.configure do |config|
  config.include Capybara::DSL
end

describe 'Searching for a video' do
  it 'allows searches for general terms' do
    visit ''
    fill_in('search_query', with: 'text adventures')
    click_button('search-btn')

    expect(page).to have_content('GET LAMP: The Text Adventure Documentary')
  end
end
