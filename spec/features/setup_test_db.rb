require 'pg'

def setup_test_db
  con = PG.connect :dbname => 'bookmark_manager_test'
  con.exec "TRUNCATE TABLE bookmarks;"
end

