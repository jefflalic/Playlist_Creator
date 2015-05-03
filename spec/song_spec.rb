require 'rspec'
require 'playlist'
require 'song'

describe Song do
  describe '#title' do
    it 'will return the title of the song' do
      test_song = Song.new(title: "Westley's Theory")
      expect(test_song.title).to eq("Westley's Theory")
    end
  end
  describe '#artist' do
    it 'will return the name of the artist' do
      test_song = Song.new(artist: "Kendrick Lamar")
      expect(test_song.artist).to eq("Kendrick Lamar")
    end
  end
end