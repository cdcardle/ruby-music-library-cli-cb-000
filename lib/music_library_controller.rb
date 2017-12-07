class MusicLibraryController
  attr_accessor

  def initialize(path)
    MusicImporter(path)
  end
end
