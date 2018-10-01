class Artist

  attr_accessor :id,:first_name,:last_name,:dob

  def self.open_connection
    conn = PG.connect(dbname: 'art')
  end

  def save
    conn = Artist.open_connection
    #If the class instance that we're running
    # the save method on does not have an id
    #  then create, else update
    if !self.id
      sql = "INSERT INTO artist (first_name,last_name,dob) VALUES ('#{self.first_name}',#{self.last_name},#{self.dob})"
    else
      sql = "UPDATE artist SET first_name='#{self.first_name}',last_name='#{self.last_name}',dob='#{self.dob}'WHERE id=#{self.id}"
    end
    conn.exec(sql)
  end

  def self.hydrate art_data
    artist = Artist.new
    artist.id = art_data['id']
    artist.first_name = art_data['first_name']
    artist.last_name = art_data['last_name']
    artist.dob = art_data['dob']

    artist
  end

  def self.all
    conn = self.open_connection
    sql = "SELECT * FROM artist ORDER BY id"
    results = conn.exec(sql)
    artist = results.map do |artist|
      self.hydrate artist
    end
  end

  def self.find id
    conn = self.open_connection
    sql = "SELECT * FROM artist WHERE id=#{id}"
    results = conn.exec(sql)
    art = self.hydrate results[0]
    art
  end

  def self.destroy id
    conn = self.open_connection
    sql = "DELETE FROM artist WHERE id=#{id}"
    conn.exec(sql)
  end
end
