feature 'deleting bookmark' do

  scenario 'checks that we can delete a bookmark on the list' do

    Bookmark.create(url: 'https://www.bbc.co.uk', title: 'BBC')

    visit '/'

    click_button 'All Bookmarks'

    expect(page).to have_link('BBC', href: 'https://www.bbc.co.uk')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    
    expect(page).not_to have_link('BBC', href: 'https://www.bbc.co.uk')
   
  end
  
end