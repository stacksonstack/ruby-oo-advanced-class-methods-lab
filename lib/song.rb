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
    song = Song.new
    @@all.push(song)
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    @@all.push(song)
    song
  end

  def self.find_by_name(name)
    Song.all.find do |ele|
      name == ele.name
    end
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort do |ele1, ele2|
      ele1.name <=> ele2.name
    end
  end

  def self.new_from_filename(name)
    nameVar = name.split("-")
    song = Song.new
    song.artist_name = nameVar[0].strip
    song.name = nameVar[1].split('.')[0].strip
    song
  end

  def self.create_from_filename(name)
    song = new_from_filename(name)
    @@all.push(song)
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
