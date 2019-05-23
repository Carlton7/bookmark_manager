feature 'bookmark checking' do

  scenario 'checks that the route /bookmarks allows us to view our bookmarks' do
    visit '/'

    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'DestroyAllSoftware')
    Bookmark.create(url: 'http://www.google.com', title: 'Google')

    click_button 'All Bookmarks'

    expect(page). to have_link('Google' , href: 'http://www.google.com')
    expect(page). to have_link('Makers' , href: 'http://www.makersacademy.com')
    expect(page). to have_link('DestroyAllSoftware' , href: 'http://www.destroyallsoftware.com')
  end
  
end