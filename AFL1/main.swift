//
//  main.swift
//  AFL1
//  Jeshaiah Jesse
//  0706012110015
//  Created by MacBook Pro on 03/03/23.
//

import Foundation

var hp = 100
var maxHp = 100
var mp = 50
var maxMp = 50
var potions = 10
var elixirs = 5

print("""
Welcome to the world of magic! 🦄🧝🏻‍♀️.

You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests 🌲, mountains 🏔️, and dungeons 🏯, where you will face challenges, make allies, and fight enemies 🧌!

""")

//Untuk menghandle UserInput, hanya menerima pencetan return agar program terus berlanjut
var userInput = ""
repeat {
    print("Press [return] to continue :", terminator: "")
    print("")
    userInput = readLine() ?? ""
} while userInput != ""

print("May I know your name, a young wizard?")

//Hanya menerima alphabetical char, untuk input username
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

//Function To Print Player Stats
func printPlayerStats() {
    print("Player name: \(userName)")
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

//Function To Print HealWoundMana
func printHealWound() {
    print("Your HP is \(hp)")
    print("Your Mana is \(mp)")
    print("")
    print("Inside your backpack 🎒 : ")
    print("You have \(potions) Potions.")
    print("You have \(elixirs) Elixirs.") // Add elixir count

    while true {
        print("Are you sure want to use 1 potion or elixir to heal wound? [P/E/N]")
        let choice = readLine()?.lowercased() ?? ""

        switch choice {
        case "p": // Use potion
            if potions > 0 {
                if hp == maxHp {
                    print("You already have full health!")
                    print("Press [return] to go back: ")
                    let _ = readLine()
                    return
                }
                hp += 20
                if hp > maxHp {
                    hp = maxHp
                }
                potions -= 1

                print("Your HP is now: \(hp)")
                print("You have \(potions) Potion left.")
                print("Still want to use 1 potion or elixir to heal wound again? [Y/N]")
            } else {
                print("You don't have any potion left. Be careful of your next journey.")
                print("Press [return] to go back: ")
                let _ = readLine()
                exit(0)
            }

        case "e": // Use elixir
            if elixirs > 0 {
                if mp == maxMp {
                    print("You already have full mana!")
                    print("Press [return] to go back: ")
                    let _ = readLine()
                    return
                }
                mp += 50 // Elixir to add heroes mana
                if mp > maxMp {
                    mp = maxMp
                }
                elixirs -= 1

                print("Your MP is now: \(mp)")
                print("You have \(elixirs) Elixir left.") // Update elixir count
                print("Still want to use 1 potion or elixir to add mana again? [Y/N]")
            } else {
                print("You don't have any elixir left. Be careful of your next journey.")
                print("Press [return] to go back: ")
                let _ = readLine()
                exit(0)
            }

        case "n": // Exit
            return // Return to the main menu

        default: // Invalid input
            continue
        }

        let confirm = readLine()?.lowercased() ?? ""
        if confirm == "n" {
            return // Return to the main menu
        }
    }
}

//Sebuah fungsi untuk mengprint display forest of troll, yang berisi algoritma bertarung
func printForestTroll(){
    var trollHP = 500
    let trollMaxHP = 500
    var playerChoice = ""
    let mobsT = "Troll"
    let troll = 1

    print("As you enter the forest, you feel a sense of unease wash over you.")
    print("Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.\n")
    print("👹 Name : \(mobsT) x\(troll)")
    print("👹 Health : \(trollHP)")
    print("")

    // Troll's turn
    func trollAttack() {
        let trollDamage = Int.random(in: 1...10)
        hp -= trollDamage
        print("Troll attacks you and deals \(trollDamage) damage.")
        print("Your HP is now \(hp)/\(maxHp).\n")
    }

    // Player's turn
    func playerAttack() {
        print("\nChoose your action:")
        print("[1] Physical Attack. No mana required. Deal 35pt of damage.")
        print("[2] Meteor. Use 15pt of MP. Deal 100pt of damage.")
        print("[3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.")
        print("[4] Use Potion to heal wound.")
        print("[5] Scan enemy's vital.")
        print("[6] Flee from battle.")
        print("Your choice?")
        playerChoice = readLine()?.lowercased() ?? ""
        switch playerChoice {
        case "1":
            let playerDamage = 35
            trollHP -= playerDamage
            print("You hit the Troll and deal \(playerDamage) damage.")
        case "2":
            if mp < 15 {
                print("You don't have enough MP to use this skill.")
                playerAttack()
            } else {
                let playerDamage = 100
                trollHP -= playerDamage
                mp -= 15
                print("You use Meteor and deal \(playerDamage) damage to the Troll.")
            }
        case "3":
            if mp < 10 {
                print("You don't have enough MP to use this skill.")
                playerAttack()
            } else {
                print("You use Shield and block enemy's attack in 1 turn.")
                mp -= 10
            }
        case "4":
            if potions > 0 {
                hp += 20
                if hp > maxHp {
                    hp = maxHp
                }
                potions -= 1
                print("You use a potion to heal your wounds. Your HP is now \(hp)/\(maxHp).")
            } else {
                print("You don't have any potions left.")
                playerAttack()
            }
        case "5":
            print("You scan the Troll's vital and find out that its HP is \(trollHP)/\(trollMaxHP).")
        case "6":
            trollHP = 0
            // Go back to the Journey screen
            print("""
            You feel that if you don't escape soon, you won't be able to continue the fight.
            You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.

            You're safe, for now.
            Going back ... To Journey Screen!

            """)
            return
        default:
            print("Invalid choice. Please choose a valid option.")
            playerAttack()
        }
    }

    while trollHP > 0 && hp > 0 {
        // Troll attacks first if player didn't use Shield in previous turn
        if playerChoice != "3" {
            trollAttack()
        }
        if hp > 0 {
            playerAttack()
        } else {
            print("You have been defeated by the Troll. Game over.")
            exit(0)
        }
    }

    if trollHP <= 0 {
        let Items = Int.random(in: 1...5)
        potions += Items
        elixirs += Items
        print("You get \(Items) Potions and Elixir on the way home!")
    }
}

//Sebuah fungsi untuk mengprint display mountain of golem, yang berisi algoritma bertarung
func printMountainGolem(){
    var golemHP = 1000
    let golemMaxHP = 1000
    var playerChoice = ""
    let mobsG = "Golem"
    let golem = 1

    print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin.")
    print("Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.\n")
    print("👹 Name : \(mobsG) x\(golem)")
    print("👹 Health : \(golemHP)")
    print("")

    // Golem's's turn
    func golemAttack() {
        let golemDamage = Int.random(in: 1...5)
        hp -= golemDamage
        print("Golem attacks you and deals \(golemDamage) damage.")
        print("Your HP is now \(hp)/\(maxHp).\n")
    }

    // Player's turn
    func playerAttackG() {
        print("\nChoose your action:")
        print("[1] Physical Attack. No mana required. Deal 35pt of damage.")
        print("[2] Meteor. Use 15pt of MP. Deal 100pt of damage.")
        print("[3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.")
        print("[4] Use Potion to heal wound.")
        print("[5] Scan enemy's vital.")
        print("[6] Flee from battle.")
        
        print("Your choice?")
        playerChoice = readLine()?.lowercased() ?? ""
        
        switch playerChoice {
        case "1":
            let playerDamage = 35
            golemHP -= playerDamage
            print("You hit the Golem and deal \(playerDamage) damage.")
        case "2":
            if mp < 15 {
                print("You don't have enough MP to use this skill.")
                playerAttackG()
            } else {
                let playerDamage = 100
                golemHP -= playerDamage
                mp -= 15
                print("You use Meteor and deal \(playerDamage) damage to the Golem.")
            }
        case "3":
            if mp < 10 {
                print("You don't have enough MP to use this skill.")
                playerAttackG()
            } else {
                print("You use Shield and block enemy's attack in 1 turn.")
                mp -= 10
            }
        case "4":
            if potions > 0 {
                hp += 20
                if hp > maxHp {
                    hp = maxHp
                }
                potions -= 1
                print("You use a potion to heal your wounds. Your HP is now \(hp)/\(maxHp).")
            } else {
                print("You don't have any potions left.")
                playerAttackG()
            }
        case "5":
            print("You scan the Troll's vital and find out that its HP is \(golemHP)/\(golemMaxHP).")
        case "6":
            golemHP = 0
            // Go back to the Journey screen
            print("""
            You feel that if you don't escape soon, you won't be able to continue the fight.
            You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.

            You're safe, for now.
            Going back ... To Journey Screen!

            """)
            return
        default:
            print("Invalid choice. Please choose a valid option.")
            playerAttackG()
        }
    }

    while golemHP > 0 && hp > 0 {
        // Troll attacks first if player didn't use Shield in previous turn
        if playerChoice != "3" {
            golemAttack()
        }
        if hp > 0 {
            playerAttackG()
        } else {
            print("You have been defeated by the Golem. Game over.")
            exit(0)
        }
    }

    if golemHP <= 0  {
        let Items = Int.random(in: 1...4)
        potions += Items
        elixirs += Items
        print("You get \(Items) Potions and Elixir on the way home!")
    }
}

//Selama kondisi tidak memilih case Q atau quit, maka loop akan terus berlangsung
while true {
    print("\nFrom here, you can...\n")
    print("[C]heck your health and stats")
    print("[H]eal your wounds with potion\n")
    print("...or choose where you want to go")
    print("")
    print("[F]orest of Troll")
    print("[M]ountain of Golem")
    print("[Q]uit game\n")
    
    print("Your choice?")
    let choice = readLine()?.lowercased() ?? ""
    print("")
    
    switch choice {
    case "c":
        printPlayerStats()
    case "h":
        printHealWound()
    case "f":
        printForestTroll()
    case "m":
        printMountainGolem()
    case "q":
        exit(0)
    default:
        print("Invalid choice. Please choose a valid option.")
    }
}
