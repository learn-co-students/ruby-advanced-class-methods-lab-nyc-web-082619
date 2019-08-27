require 'pry'

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
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    return song ? song : create_by_name(name)
  end
  
  def self.alphabetical
    @@all.map{|song| (song.name)}.sort.map{|name| find_by_name(name)}
  end
  
  def self.new_from_filename(filename)

    song = filename.split(' - ')
    song[1] = song[1][0..-5]
    return_song = Song.new
    return_song.name = song[1]
    return_song.artist_name = song[0]
    return_song
    
  end
  
  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
      
end
