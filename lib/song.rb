class Song
  attr_reader(:title, :artist)
  
  def initialize(song_info)
    @title = song_info[:title]
    @artist = song_info[:artist]
  end
end