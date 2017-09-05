require 'pry'
class Pokemon
  attr_reader :id, :name, :type, :db, :hp

  def initialize(id: id, name: name, type: type, db: db, hp: hp = nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
  end

  def self.find(id, db)
    poke_array = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
    Pokemon.new(id: poke_array[0], name: poke_array[1], type: poke_array[2], hp: poke_array[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = #{self.id}")
  end

end
