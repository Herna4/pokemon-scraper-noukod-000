# class Pokemon

#     attr_accessor :name, :type, :id, :hp, :db

#     @@all = []

#     def initialize(pokemon)
#       @id = pokemon[:id]
#       @name = pokemon[:name]
#       @type = pokemon[:type]
#       @db = pokemon[:db]
#       @hp = pokemon[:hp]
#       @@all << self

#       pokemon
#     end

#     def self.all
#       @@all
#     end

#     def self.save(name, type, db)
#       db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type )
#     end

#     def self.find(id,db)
#       name = db.execute("SELECT name FROM pokemon WHERE id = #{id}").flatten[0]
#       type = db.execute("SELECT type FROM pokemon WHERE id = #{id}").flatten[0]
#       # hp = db.execute("SELECT hp FROM pokemon WHERE id = #{id}").flatten[0]
#       hash = {id: id, name: name, type: type, db: db}

#       newPokemon = Pokemon.new(hash)
#     end

#     def alter_hp(num, db)
#       db.execute("UPDATE pokemon SET hp = #{num}
#               WHERE id = #{self.id}")
#     end
# end


class Pokemon
# <<<<<<< HEAD

  attr_accessor :id, :name, :db, :type, :hp

  def initialize id:, name:, type:, db:, hp: ""
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp

  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name,type)
  end

  def self.find(id, db)
    answer = db.execute("SELECT * FROM pokemon WHERE id = ?",id)[0]
    id_, name, type, hp = answer

    new(id: id_, name: name, type: type,db: db, hp: hp)
  end

  def alter_hp(num, db)
      db.execute("UPDATE pokemon SET hp = #{num}
              WHERE id = #{self.id}")
  end
# =======
  attr_accessor :id, :name, :db, :type, :hp

  def initialize id:, name:, type:, db:, hp: ""
    @id, @name, @type, @db, @hp = id, name, type, db, hp

  end

  def self.save name, type, db
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name,type)
  end

  def self.find id, db
    result = db.execute("SELECT * FROM pokemon WHERE id = ?",id)[0]
    id_, name, type, hp = result
    # db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",60,id_) if result.length != 3
    new(id: id_, name: name, type: type,db: db, hp: hp)
  end

  def alter_hp (hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",hp,id)
  end

# >>>>>>> a709fd0364a15a098302f2f48805664df0ec99b5
end
