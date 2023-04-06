//
//  Battle.swift
//  AFL1
//
//  Created by MacBook Pro on 06/04/23.
//

import Foundation

class Battle {
    var player: Player
    var monster: Monster
    
    init(player: Player, monster: Monster) {
        self.player = player
        self.monster = monster
    }
    // Rest of the Battle class remains the same
    func start() {
        print("A wild \(monster.name) has appeared!")
//        print("\(monster.name) Health : \(monster.hp)")
            
            battleLoop: while player.hp > 0 && monster.hp > 0 {
        
                print("\(monster.name) Health : \(monster.hp)")
                print("\nChoose your action:")
                print("[1] Physical Attack. No mana required. Deal 35pt of damage.")
                print("[2] Meteor. Use 15pt of MP. Deal 100pt of damage.")
                print("[3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.")
                print("[4] Use Potion to heal wound.")
                print("[5] Scan enemy's vital.")
                print("[6] Flee from battle.")
                print("Your choice : ")
                
                if let input = readLine() {
                    switch input {
                    case "1":
                        monster.takeDamage(player.attack())
                        print("")
                        print("You hit the \(monster.name) and deal \(player.attack()) damage.")
                    case "2":
                        player.castMeteor(monster)
                    case "3":
                        // Implement shield usage
                        player.activateShield()
                    case "4":
                        // Implement potion usage
                        player.usePotion()
                    case "5":
                        // Implement enemy scanning
                        scanEnemy(monster)
                    case "6":
                        // Implement fleeing from battle
                        if flee() {
                        break battleLoop
                        }
                    default:
                        print("Invalid input!")
                    }
                }
            print("")
                
                // Enemy's turn (assuming enemy only uses a physical attack)
                if monster.hp > 0 {
                    player.takeDamage(monster.attack())
                }
            }
            
            if player.hp <= 0 {
                print("You have been defeated!")
            } else {
               
            }
        }
    
    func scanEnemy(_ monster: Monster) {
            print("\n\(monster.name)'s vital:")
            print("HP: \(monster.hp)/\(monster.maxHp)")
            print("MP: \(monster.mp)/\(monster.maxMp)")
        }
    
    func flee() -> Bool {
            let success = Int.random(in: 1...100) <= 50
            
            if success {
                   print("\nYou successfully fled from the battle!")
                   print("You found 1 potions and 1 elixirs.")
                   player.potions += 1
                   player.elixirs += 1
            } else {
                   print("\nFailed to flee from the battle!")
            }

            return success
        }
    
}
