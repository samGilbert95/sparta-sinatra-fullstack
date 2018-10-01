class Art

  attr_accessor :id,:pic_name,:pic_date,:artist_id,:image

  def self.open_connection
    conn = PG.connect(dbname: 'art')
  end

  def save
    conn = Art.open_connection
    #If the class instance that we're running
    # the save method on does not have an id
    #  then create, else update
    if !self.id
      sql = "INSERT INTO art (pic_name,pic_date,artist_id,image) VALUES ('#{self.pic_name}',#{self.pic_date},#{self.artist_id},#{self.image})"
    else
      sql = "UPDATE art SET pic_name='#{self.pic_name}',pic_date='#{self.pic_date}',artist_id='#{self.artist_id}',image = '#{self.image}' WHERE id=#{self.id}"
    end
    conn.exec(sql)
  end

  def self.hydrate art_data
    art = Art.new
    art.id = art_data['id']
    art.pic_name = art_data['pic_name']
    art.pic_date = art_data['pic_date']
    art.artist_id = art_data['artist_id']
    art.image = art_data['image']

    art
  end

  def self.all
    conn = self.open_connection
    sql = "SELECT * FROM art ORDER BY id"
    results = conn.exec(sql)
    art = results.map do |piece|
      self.hydrate piece
    end
  end

  def self.find id
    conn = self.open_connection
    sql = "SELECT * FROM art WHERE id=#{id}"
    results = conn.exec(sql)
    art = self.hydrate results[0]
    art
  end

  def self.destroy id
    conn = self.open_connection
    sql = "DELETE FROM art WHERE id=#{id}"
    conn.exec(sql)
  end
end
