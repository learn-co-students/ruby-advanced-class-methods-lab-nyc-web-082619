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
    self.all << song
    song 
  end

  def self.new_by_name(sName)
    song = Song.new
    song.name = sName
    song
  end

  def self.create_by_name(sName)
    song = Song.new
    song.name = sName
    self.all << song
    song
  end

  def self.find_by_name(sName)
    self.all.find do |song|
      song.name == sName
    end
  end

  def self.find_or_create_by_name(sName)
    self.create_by_name(sName)
    self.find_by_name(sName)
  end

  def self.alphabetical
    self.all.sort_by{ |song| song.name }
  end

  def self.new_from_filename(sNameFile)
    artistAndName = sNameFile.split(" - ")
    artistName = artistAndName[0]
    nameWithExt = artistAndName[1].split(".")
    songName = nameWithExt[0]
    
    song = Song.new
    song.name = songName
    song.artist_name = artistName
    song
  end

  def self.create_from_filename(sNameFile)
    artistAndName = sNameFile.split(" - ")
    artistName = artistAndName[0]
    nameWithExt = artistAndName[1].split(".")
    songName = nameWithExt[0]
    
    song = Song.new
    song.name = songName
    song.artist_name = artistName
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear 
  end

  #song = Song.new_from_filename("Thundercat - For Love I Come.mp3")
   #   expect(song.name).to eq("For Love I Come")
    #  expect(song.artist_name).to eq("Thundercat")

end
