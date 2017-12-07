class MusicLibraryController
  attr_accessor :path

  def initialize(path)
    MusicImporter(path)
  end
end
