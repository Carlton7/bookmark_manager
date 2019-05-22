require 'pg'

def setup_test_db
  con = PG.connect :dbname => 'bookmark_manager_test'
  con.exec "TRUNCATE TABLE bookmarks;"
  # con.exec "INSERT INTO bookmarks(url) VALUES ('http://www.makersacademy.com'), ('http://www.google.com'), ('http://www.destroyallsoftware.com');"
end

