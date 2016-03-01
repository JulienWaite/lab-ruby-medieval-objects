#create a [Person class] <-- this class is the top in the hierachy of objects
  #attributes of [Person class] must include first_name, last_name and full_name

class Person
  attr_accessor :first_name, :lastname
  def initialize first_name, last_name, full_name
    @first_name = first_name
    @last_name = last_name
    @full_name = "#{first_name} #{last_name}"
  end
end

#create a [Player sub-class] of the Person class
  #attributes of [Player class] include health (default: 20), strength (default: 5), alive (default: true)
    #methods of [Player class] include take_damage(attack_strength): and attack(player):
class Player < Person
  attr_accessor :health, :strength, :alive
  def initialize health=20, strength=5, alive=true
    super first_name, last_name # will try to find the function in the parent
    @health = health
    @strength = strength
    @alive = false if health < 0
  end

  def take_damage attack_strength
    @health -= attack_strength
  end
  def attack otherplayer
    otherplayer.take_damage @strength
  end
end

#create a [Knight sub-class] of the Player class
  #attributes of the Knight include health (default: 50) and strength (default: 7)
class Knight < Player
  def initialize health=50, strength=7, alive=true
    super
  end
end
#create a [Wizard sub-class] of the Player class
  #attributes of the Wizard include health (default: 20) and strength (default: 25 <-- changed from the given 75
class Wizard < Player
  def initialize health=20, strength=25, alive=true
    super
  end
end

# time for the knight and wiard to fight!!!
lancelot = Knight.new
merlin = Wizard.new

# returns the class of lancelot and merlin
puts lancelot.class
puts merlin.class

# returns the super class of the class of lancelot and merlin
puts lancelot.class.superclass
puts merlin.class.superclass

# time for lancelot and merlin do something together!
lancelot.attack merlin
p merlin.health