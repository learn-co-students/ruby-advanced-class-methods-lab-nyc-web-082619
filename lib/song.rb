class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end
  
  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end
  
  def self.find_by_name(title)
    self.all.find {|song| song.name == title}
  end
  
  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else 
      self.create_by_name(title)
    end
  end
  
  def self.alphabetical
    arr = self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    filename.slice!('.mp3')
    file_array = filename.split('-')
    song = self.new_by_name(file_array[1].strip)
    song.artist_name = file_array[0].strip
    song
  end
  
  def self.create_from_filename(filename)
    filename.slice!('.mp3')
    file_array = filename.split('-')
    song = self.create_by_name(file_array[1].strip)
    song.artist_name = file_array[0].strip
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
