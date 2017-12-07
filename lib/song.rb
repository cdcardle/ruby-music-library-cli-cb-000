class Song
  attr_accessor :name, :genre
  attr_reader:artist
  @@all = []

  def self.all
    @@all
  end

  def initialize(name = nil, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  def save
    @@all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    new.tap do |song|
      song.name = name
      song.save
    end
  end

  def artist=(artist)
    if artist.class == Artist
      @artist = artist
      self.artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre.class == Genre
      @genre = genre
      self.genre.songs << self unless self.genre.songs.include?(self)
    end
  end

  def self.find_by_name(name)
    all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    info = filename.split(" - ")
    artist = Artist.find_or_create_by_name(info[0])
    genre = Genre.find_or_create_by_name(info[2].gsub(".mp3", ""))

    new(info[1], artist, genre) unless find_by_name(info[1])
  end

  def self.create_by_filename(filename)
    new_from_filename(filename).tap {|song| song.save}
  end
end
