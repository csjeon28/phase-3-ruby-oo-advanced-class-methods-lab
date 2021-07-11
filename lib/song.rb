class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(string)
    song = self.new
    song.name = string
    song
  end

  def self.create_by_name(string)
    song = self.create
    song.name = string
    song
  end

  def self.find_by_name(string)
    self.all.find {|song| song.name == string}
  end

  def self.find_or_create_by_name(string)
    self.find_by_name(string) || self.create_by_name(string)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    split_name = filename.split(" - ")
    artist_name = split_name[0]
    song_name = split_name[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    split_name = filename.split(" - ")
    artist_name = split_name[0]
    song_name = split_name[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
