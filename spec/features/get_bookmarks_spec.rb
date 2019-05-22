feature 'bookmark checking' do

  scenario 'checks that the route /bookmarks allows us to view our bookmarks' do
    visit '/'

    con = PG.connect(dbname: 'bookmark_manager_test')
    
    con.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    con.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    con.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    click_button 'All Bookmarks'

    expect(page). to have_content 'http://www.google.com'
    expect(page). to have_content 'http://www.makersacademy.com'
    expect(page). to have_content 'http://www.destroyallsoftware.com'
  end
  
end