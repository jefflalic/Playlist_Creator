class Playlist
  attr_reader(:name, :date_added, :playlist_id, :songs)
  @@playlist_collection = []

  def initialize(attributes)
    @name = attributes[:name]
    @date_added = attributes[:date_added]
    @playlist_id = @@playlist_collection.length + 1
    @songs = []
  end

  def save
    @@playlist_collection.push(self)
  end

  def self.all
    @@playlist_collection
  end

  def self.clear
    @@playlist_collection = []
  end

  def self.get_playlist(id_number)
    playlist_found = nil
    @@playlist_collection.each do |playlist|
      if playlist.playlist_id == id_number
        playlist_found = playlist
      end
    end
    playlist_found
  end

  def add_song(song)
    @songs.push(song)
  end
end