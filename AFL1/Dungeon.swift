//
//  Dungeon.swift
//  AFL1
//
//  Created by MacBook Pro on 06/04/23.
//

import Foundation

class Dungeon {
    let monster: Monster
    let name: String
    
    init(monster: Monster, name: String) {
          self.monster = monster
          self.name = name
      }
    
    // Implement the dungeon loop and actions here
    
    func start(player: Player) {
        let battle = Battle(player: player, monster: monster)
        battle.start()

        if monster.hp <= 0 {
            print("You have defeated the \(monster.name) in the \(name)!")
            print("You found 2 potions and 1 elixirs.")
            player.potions += 2
            player.elixirs += 1
        }
    }
}

class ForestOfTrollDungeon: Dungeon {
    init() {
        super.init(monster: Troll(), name: "Forest of Troll")
    }
}

class MountainOfGolemDungeon: Dungeon {
    init() {
        super.init(monster: Golem(), name: "Mountain of Golem")
    }
}
