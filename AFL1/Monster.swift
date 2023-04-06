//
//  Monster.swift
//  AFL1
//
//  Created by MacBook Pro on 06/04/23.
//

import Foundation

class Monster: Character {
        let name: String
        var hp: Int
        let maxHp: Int
        var mp: Int
        let maxMp: Int
    
    init(name: String, hp: Int, maxHp: Int, mp: Int, maxMp: Int) {
        self.name = name
        self.hp = hp
        self.maxHp = maxHp
        self.mp = mp
        self.maxMp = maxMp
    }
    
    func attack() -> Int {
        fatalError("attack() should be implemented by subclasses.")
    }
    
    func takeDamage(_ damage: Int) {
        hp -= damage
    }
}

class Troll: Monster {
    init() {
        super.init(name: "Troll", hp: 500, maxHp: 500, mp: 0, maxMp: 0)
    }
    
    override func attack() -> Int {
        return Int.random(in: 1...10)
    }
}

class Golem: Monster {
    init() {
        super.init(name: "Golem", hp: 1000, maxHp: 1000, mp: 0, maxMp: 0)
    }
    
    override func attack() -> Int {
        return Int.random(in: 1...5)
    }
}

