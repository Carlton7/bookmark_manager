feature 'adding bookmark' do

  scenario 'checks that we can add a bookmark to the list' do
    visit '/'

    click_button 'All Bookmarks'

    click_button 'Add Bookmark'

    fill_in 'url', with: 'https://www.bbc.co.uk'
    fill_in 'title', with: 'BBC'

    click_button 'Submit'

    expect(page). to have_link('BBC', href: 'https://www.bbc.co.uk')
   
  end
  
end