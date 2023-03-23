// HW1: An RPG Game
// Amber Etana kav835

// An enum containing the different type of weapons to be selected
enum WeaponType: String {
    case dagger = "dagger"
    case axe = "axe"
    case staff = "staff"
    case sword = "sword"
    case none = "none"

    init(fromRawValue: String) {
        self = WeaponType(rawValue: fromRawValue) ?? .none
    }

    // a variable containing the damage of each weapon type
    var damage:Int{
        switch(self){
        case .dagger:
            return 4
        case .axe:
            return 6
        case .staff:
            return 6
        case .sword:
            return 10
        case .none:
            return 1
        }
    }
}

// Define a weapons class which contains the weapon type
class Weapon {
    var type: WeaponType

    init(weaponType:String) {
        self.type = WeaponType(fromRawValue: weaponType)
    }
}

// An enum containing the different type of armors to be selected
enum ArmorType: String {
    case plate = "plate"
    case chain = "chain"
    case leather = "leather"
    case none = "none"

    init(fromRawValue: String) {
        self = ArmorType(rawValue: fromRawValue) ?? .none
    }

    // The level of protection from each armor
    var protection:Int{
        switch(self){
        case .plate:
            return 2
        case .chain:
            return 5
        case .leather:
            return 8
        case .none:
            return 10
        }
    }
}

// An armor class that contains the armor type
class Armor {
    var type: ArmorType

    init(armorType: String) {
        self.type = ArmorType(fromRawValue: armorType)
    }
}

// The parent class that each type of character shall inherit.
class RPGCharacter {
    var name: String
    var health: Int
    var spellPoints: Int
    var weapon: Weapon
    var armor: Armor
    var maxHealth: Int

    init(name:String, health:Int, spellPoints:Int, weapon:Weapon, armor:Armor, maxHealth:Int){
        self.name = name
        self.health = health
        self.spellPoints = spellPoints
        self.weapon = weapon
        self.armor = armor
        self.maxHealth = maxHealth
    }
    func wield(weaponObject: Weapon){
        self.weapon = weaponObject
        print("\(name) is now wielding a(n) \(weapon.type)")
    }
    func putOnArmor(armorObject: Armor){
        self.armor = armorObject
        print("\(name) is now wearing \(armor.type)")

    }
    func unwield(){
        self.weapon.type = .none
        print("\(name) is no longer wielding anything")
    }
    func takeOffArmor(){
        self.armor.type = .none
        print("\(name) is no longer wearing anything")
    }
    func fight(opponent:RPGCharacter){
        print("\(name) attacks \(opponent.name) with a(n) \(self.weapon.type)")
        opponent.health = opponent.health - self.weapon.type.damage
        print("\(self.name) does \(self.weapon.type.damage) damage to \(opponent.name).")
        print("\(opponent.name) is now down to \(opponent.health) health")
        opponent.checkForDefeat(opponent: opponent)
    }
    func checkForDefeat(opponent: RPGCharacter){
        if (opponent.health <= 0){
            print("\(opponent.name) has been defeated!")
        }
    }
    func show(){
        print(self.name)
        print("   Current Health:\(self.health)")
        print("   Current Spell Points:\(self.spellPoints)")
        print("   Wielding:\(self.weapon.type)")
        print("   Wearing: \(self.armor.type)")
        print("   Armor Class: \(self.armor.type.protection)")
    }
}

// A subclass that inherits from the parent class.
// Gets all the variables and functions from the parent class.
class Fighter: RPGCharacter {
    init(name:String){
        super.init(name: name, health: 40, spellPoints: 0, weapon: Weapon(weaponType: "none"), armor: Armor(armorType: "none"), maxHealth: 40)
    }

}

// A subclass that inherits from the parent class
// Gets all the varaibles and functions from the parent class
class Wizard: RPGCharacter {
    init(name:String){
        super.init(name: name, health: 16, spellPoints: 20, weapon: Weapon(weaponType: "none"), armor: Armor(armorType: "none"), maxHealth: 16)
    }

    // We need to overrie the weild class because the wizard is only allowed certain weapons
    override func wield(weaponObject: Weapon) {
        switch(weaponObject.type){

        case .dagger, .staff, .none:
            self.weapon = weaponObject
            print("\(name) is now wielding a(n) \(weapon.type)")
        case .axe, .sword:
            print("Weapon not allowed for this character class")
            return
        }
    }

    // We need to override the armor class because the wizard is not allowed any armor
    override func putOnArmor(armorObject: Armor) {
        print("Armor not allowed for this character class.")
    }

    // A unique function to only a wizard.
    func castSpell(spellName:String, target:RPGCharacter){
        var effect = 0
        if (self.spellPoints < 3 && spellName == "Fireball"){
            print("Insufficient Spell Points")
            return
        }
        else if (self.spellPoints < 10 && spellName == "Lightning Bolt"){
            print("Insufficient Spell Points")
            return
        }
        else if (self.spellPoints < 6 && spellName == "Heal"){
            print("Insufficient Spell Points")
            return
        }

        if (spellName == "Fireball"){
            self.spellPoints = self.spellPoints - 3
            target.health = target.health - 5
            effect = 5
        }
        else if (spellName == "Lightning Bolt"){
            self.spellPoints = self.spellPoints - 10
            target.health = target.health - 10
            effect = 10
        }
        else if (spellName == "Heal"){
            self.spellPoints = self.spellPoints - 6
            if (target.health + 6 > target.maxHealth){
                target.health = target.maxHealth
                effect = target.maxHealth - target.health
            }
            else {
                target.health = target.health + 6
                effect = 6
            }
        }
        else{
            print("Unknown spell name. Spell failed")
            return
        }
        print("\(self.name) casts \(spellName) at \(target.name)")
        if (spellName == "Heal"){
            print("\(self.name) heals \(target.name) for \(effect) health points")
            print("\(target.name) is now at \(target.health) health.")
        }
        else{
            print("\(self.name) does \(effect) damage to \(target.name)")
            print("\(target.name) is now down to \(target.health) health")
        }
    }
}

//MAIN
// Create one of each armor and weapon for use
let plateMail = Armor(armorType:"plate")
let chainMail = Armor(armorType:"chain")
let sword = Weapon(weaponType:"sword")
let staff = Weapon(weaponType:"staff")
let axe = Weapon(weaponType:"axe")

let gandalf = Wizard(name:"Gandalf the Grey")
gandalf.wield(weaponObject:staff)

let aragorn = Fighter(name:"Aragorn")
aragorn.putOnArmor(armorObject:plateMail)
aragorn.wield(weaponObject:axe)

gandalf.show()
aragorn.show()

gandalf.castSpell(spellName:"Fireball",target:aragorn)
aragorn.fight(opponent:gandalf)

gandalf.show()
aragorn.show()

gandalf.castSpell(spellName:"Lightning Bolt",target:aragorn)
aragorn.wield(weaponObject:sword)

gandalf.show()
aragorn.show()

gandalf.castSpell(spellName:"Heal",target:gandalf)
aragorn.fight(opponent:gandalf)

gandalf.fight(opponent:aragorn)
aragorn.fight(opponent:gandalf)

gandalf.show()
aragorn.show()
