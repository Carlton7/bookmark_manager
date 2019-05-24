require 'bookmark'
require 'database_helpers'

describe Bookmark do
  subject(:bookmark) { described_class } 

  describe '.all' do
    it 'returns a list of all bookmarks' do

      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'DestroyAllSoftware')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'adds a new url to bookmarks list' do
      bookmark = Bookmark.create(url: 'https://www.bbc.co.uk', title: 'BBC')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'BBC'
      expect(bookmark.url).to eq 'https://www.bbc.co.uk'
    end
  end

  describe '.delete' do
    it 'deletes a url to bookmarks list' do
      bookmark = Bookmark.create(url: 'https://www.bbc.co.uk', title: 'BBC')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end
end
