//
//  main.swift
//  AFL1
//  Jeshaiah Jesse
//  0706012110015
//  Created by MacBook Pro on 03/03/23.
//

import Foundation

print("""
Welcome to the world of magic! 🦄🧝🏻‍♀️.

You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests 🌲, mountains 🏔️, and dungeons 🏯, where you will face challenges, make allies, and fight enemies 🧌!

""")

var userInput = ""
repeat {
    print("Press [return] to continue :", terminator: "")
    print("")
    userInput = readLine() ?? ""
} while userInput != ""

print("May I know your name, a young wizard?")

var userName = ""
while true {
    print("Enter your name (letters only):", terminator: "")
    userName = readLine() ?? ""
    if userName.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil && !userName.isEmpty {
        break
    }
    print("Please enter a valid name with letters only.")
}

print("Nice to meet you, \(userName)! 🧙‍♂️")

while true {
    print("\nFrom here, you can...\n")
    print("[C]heck your health and stats")
    print("[H]eal your wounds with potion\n")
    print("...or choose where you want to go")
    print("[F]orest of Troll")
    print("[M]ountain of Golem")
    print("[Q]uit game\n")
    
    print("Your choice?")
    let choice = readLine()?.lowercased() ?? ""
    
    switch choice {
    case "c":
        print("[Player Stats screen]")
    case "h":
        print("[Heal Wound screen]")
    case "f":
        print("[Forest of Troll screen]")
    case "m":
        print("[Mountain of Golem screen]")
    case "q":
        exit(0)
    default:
        print("Invalid choice. Please choose a valid option.")
    }
}


//// Character Constant Status
//let MAX_HEALTH = 100
//let MAX_STAMINA = 100
//let MAX_ATTACK = 20
//let MAX_DEFENSE = 10
//let MAX_SKILL_POINTS = 5
//
//// Character Stats Variable
//var playerName = ""
//var playerHealth = MAX_HEALTH
//var playerStamina = MAX_STAMINA
//var playerAttack = 10
//var playerDefense = 5
//var playerSkillPoints = MAX_SKILL_POINTS
//
//// Variable For Game State
//var isGameOver = false
//var numMonsterDefeated = 0
//
//// Define Function For Game Mechanics
//func printStats() {
//    print("Name: \(playerName)")
//    print("Health: \(playerHealth)/\(MAX_HEALTH)")
//    print("Stamina: \(playerStamina)/\(MAX_STAMINA)")
//    print("Attack:  \(playerAttack)")
//    print("Defense: \(playerDefense)")
//    print("Skill Points: \(playerSkillPoints)")
//}
//
//func generateMonster() -> (name: String, health: Int, attack: Int, defense: Int) {
//    let monsterHealth = Int.random(in: 50...80)
//    let monsterAttack = Int.random(in: 5...15)
//    let monsterDefense = Int.random(in: 2...5)
//    return ("Monster", monsterHealth, monsterAttack, monsterDefense)
//}
//
//func startBattle() {
//    let monster = generateMonster()
//    print("A wild \(monster.name) appeared!")
//
//    var isBattleOver = false
//    var monsterHealth = monster.health
//
//    while !isBattleOver {
//        // Player turn
//        print("Your Health : \(playerHealth)")
//        print("Monster Health : \(monsterHealth)")
//        print("Your turn")
//        print("1. Attack")
//        print("2. Defend")
//        print("3. Use potion")
//        print("4. Use skill (costs 1 skill point)")
//        let playerInput = readLine()
//        var playerDamage = 0
//
//        switch playerInput {
//        case "1":
//            playerDamage = Int.random(in: 1...playerAttack)
//            print("You dealt \(playerDamage) damage to the \(monster.name)!")
//            playerHealth -= monster.attack
//            print("Monster dealt \(monster.attack) damage to you!")
//        case "2":
//            print("You defend and gain 5 stamina!")
//            playerStamina = min(playerStamina + 5, MAX_STAMINA)
//        case "3":
//            if playerHealth == MAX_HEALTH {
//                print("Your health is already full!")
//            } else {
//                print("You use a potion and restore 20 health!")
//                playerHealth = min(playerHealth + 20, MAX_HEALTH)
//            }
//        case "4":
//            if playerSkillPoints == 0 {
//                print("You don't have enough skill points!")
//            } else {
//                playerDamage = Int.random(in: playerAttack...MAX_ATTACK)
//                print("You use a skill and deal \(playerDamage) damage to the \(monster.name)!")
//                playerSkillPoints -= 1
//            }
//        default:
//            print("Invalid input, try again.")
//            continue
//        }
//
//        // Check if battle is over
//        monsterHealth -= playerDamage
//        if monsterHealth <= 0 {
//            isBattleOver = true
//            numMonsterDefeated += 1
//            print("You defeated the \(monster.name)!")
//            print("You gained 10 skill points and 50 stamina!")
//            playerSkillPoints = min(playerSkillPoints + 10, MAX_SKILL_POINTS)
//            playerStamina = min(playerStamina + 50, MAX_STAMINA)
//            break
//        }
//
//        // Monster turn
//        print("\(monster.name)'s turn")
//    }
//
//}
//
//startBattle()
