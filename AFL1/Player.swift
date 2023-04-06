//
//  Player.swift
//  AFL1
//
//  Created by MacBook Pro on 06/04/23.
//

import Foundation


protocol Character {
    var name: String { get }
    var hp: Int { get set }
    var maxHp: Int { get }
    var mp: Int { get set }
    var maxMp: Int { get }
    
    func attack() -> Int
    func takeDamage(_ damage: Int)
}

class Player: Character {
        let name: String
        var hp: Int
        let maxHp: Int
        var mp: Int
        let maxMp: Int
        var potions: Int
        var elixirs: Int
        var isShieldActive: Bool
    
    init(name: String, hp: Int, maxHp: Int, mp: Int, maxMp: Int, potions: Int, elixirs: Int) {
        self.name = name
        self.hp = hp
        self.maxHp = maxHp
        self.mp = mp
        self.maxMp = maxMp
        self.potions = potions
        self.elixirs = elixirs
        self.isShieldActive = false
    }
    
    func attack() -> Int {
        return 35
    }
    
    func takeDamage(_ damage: Int) {
        if isShieldActive {
            isShieldActive = false
            print("\(name) blocked the attack with Shield!")
        } else {
            hp -= damage
        }
    }
    
    func activateShield() {
        let shieldCost = 10
        
        if mp >= shieldCost {
            mp -= shieldCost
            isShieldActive = true
        }else{
            print("\nNot enough MP to cast Shield.")
        }
        
    }
    
    func usePotion() {
           if potions > 0 {
               potions -= 1
               hp = min(hp + 20, maxHp)
               print("You used a potion! Your HP is now \(hp).")
           } else {
               print("You have no potions left.")
           }
       }
    
    func useElixir() {
        if elixirs > 0 {
            elixirs -= 1
            mp = min(mp + 10, maxMp)
            print("You used a elixirs! Your MP is now \(mp)")
        } else {
            print("You have no elixirs left.")
        }
    }
    
    func recovery() {
        print("Your HP is \(hp)")
        print("Your Mana is \(mp)")
        print("")
        print("Inside your backpack 🎒 : ")
        print("You have \(potions) Potions.")
        print("You have \(elixirs) Elixirs.")

        while true {
            print("Are you sure want to use 1 potion or elixir to heal wound? [P/E/N]")
            let choice = readLine()?.lowercased() ?? ""

            switch choice {
            case "p":
                usePotion()
                return
            case "e":
                useElixir()
                return
            case "n":
                return
            default:
                continue
            }
        }
    }
    
    func playerStats(){
        print("Player name: \(name)")
          print("HP: \(hp)/\(maxHp)")
          print("MP: \(mp)/\(maxMp)")
          print("\nMagic:")
          print("- Physical Attack. No mana required. Deal 35pt of damage.")
          print("- Meteor. Use 15pt of MP. Deal 100pt of damage.")
          print("- Shield. Use 10pt of MP. Block enemy's attack in 1 turn.")
          print("\nItems:")
          print("- Potion x\(potions). Heal 20pt of your HP.")
          print("- Elixir x\(elixirs). Add 10pt of your MP.")
          var userInputPlayerStats = ""
          repeat {
              print("Press [return] to go back :", terminator: "")
              print("")
              userInputPlayerStats = readLine() ?? ""
          } while userInputPlayerStats != ""
    }
    
    func castMeteor(_ monster: Monster) {
        let meteorCost = 15
        let meteorDamage = 100
        
        if mp >= meteorCost {
            mp -= meteorCost
            monster.takeDamage(meteorDamage)
            print("\n\(name) casts Meteor, dealing \(meteorDamage) damage to the \(monster.name).")
        } else {
            print("\nNot enough MP to cast Meteor.")
        }
    }

}


