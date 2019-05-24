require 'pg'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:) 
    @id = id
    @url = url
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else 
      con = PG.connect :dbname => 'bookmark_manager'
    end
    bookmark_list = con.exec "SELECT * FROM bookmarks;"
    bookmark_list.map do |bookmark| 
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
      end
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else 
      con = PG.connect :dbname => 'bookmark_manager'
    end
    result = con.exec("INSERT INTO bookmarks(url, title) VALUES('#{url}' , '#{title}') RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else 
      con = PG.connect :dbname => 'bookmark_manager'
    end
    # con.exec("DELETE FROM bookmarks WHERE url = '#{url}' AND title = '#{title}';")
    con.exec("DELETE FROM bookmarks WHERE id = '#{id}';")
  end
end