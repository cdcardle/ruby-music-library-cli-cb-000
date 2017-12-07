class MusicLibraryController
  attr_accessor

  def initialize(path='./db/mp3s')
    MusicImporter.new(path)
  end
end
