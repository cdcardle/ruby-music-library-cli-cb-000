class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = Dir.entries(@path).select {|file| file.include?('.mp3')}
  end

  def import

  end
end
