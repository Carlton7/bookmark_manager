require 'pg'

class Bookmark

  def all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'student'
    else 
      con = PG.connect :dbname => 'bookmark_manager', :user => 'student'
    end
    bookmark_list = con.exec "SELECT * FROM bookmarks;"
    bookmark_list.map { |bookmark| bookmark['url'] }
  end
end