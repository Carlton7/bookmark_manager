require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new } 

  describe '#all' do
    it 'returns a list of all bookmarks' do
      
      con = PG.connect(dbname: 'bookmark_manager_test')
    
      con.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
      con.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
      con.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

      expect(bookmark.all).to include 'http://www.makersacademy.com'
      expect(bookmark.all).to include 'http://www.google.com'
      expect(bookmark.all).to include 'http://www.destroyallsoftware.com'
    end
  end
end
