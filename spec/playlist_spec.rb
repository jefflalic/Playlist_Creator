require 'rspec'
require 'playlist'

describe Playlist do
  before do
    Playlist.clear
  end
  describe '#name' do
    it 'will return the name of the playlist' do
      test_playlist = Playlist.new(name: "Rap")
      expect(test_playlist.name).to eq("Rap")
    end
  end
  describe '#date_added' do
    it 'will return the date the playlist was added' do
      test_playlist = Playlist.new(name: "Rap", date_added: "2015, May 3")
      expect(test_playlist.date_added).to eq("2015, May 3")
    end
  end
  describe '.all' do
    it 'returns all the playlists in @@playlist_collection array' do
      test_playlist = Playlist.new(name: "Rap", date_added: "2015, May 3")
      test_playlist.save
      expect(Playlist.all).to eq([test_playlist])
      Playlist.clear
      expect(Playlist.all).to eq([])
    end
  end
  describe '.get_playlist' do
    it 'returns the correct playlist from the given id entered' do
      test_playlist = Playlist.new(name: "Rap", date_added: "2015, May 3")
      test_playlist.save
      test_playlist_2 = Playlist.new(name: "EDM", date_added: "2015, May 4")
      test_playlist_2.save
      expect(Playlist.get_playlist(2)).to eq(test_playlist_2)
    end
  end
end