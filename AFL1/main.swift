//
//  main.swift
//  AFL1
//  Jeshaiah Jesse
//  0706012110015
//  Created by MacBook Pro on 03/03/23.
//

import Foundation

func main() {
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
        print("Enter your name (letters only): ", terminator: "")
        userName = readLine() ?? ""
        if userName.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil && !userName.isEmpty {
            break
        }
        print("Please enter a valid name with letters only.")
    }

    print("Nice to meet you, \(userName)! 🧙‍♂️")
    
    let player = Player(name: userName, hp: 100, maxHp: 100, mp: 100, maxMp: 100, potions: 3, elixirs: 1)
    
    // Rest of the main game loop
    var gameRunning = true
    
    while gameRunning {
        print("\nFrom here, you can...\n")
        print("[C]heck your health and stats")
        print("[H]eal your wounds with potion or elixirs\n")
        print("...or choose where you want to go")
        print("")
        print("[F]orest of Troll")
        print("[M]ountain of Golem")
        print("[Q]uit game\n")
        
        print("Your choice?")
        let choice = (readLine() ?? "").lowercased()
        print("")
        
        switch choice {
        case "c":
            player.playerStats()
        case "h":
            player.recovery()
        case "f":
            print("As you enter the forest, you feel a sense of unease wash over you.")
            print("Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.\n")
            let forestOfTroll = ForestOfTrollDungeon()
            forestOfTroll.start(player: player)
        case "m":
            print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin.")
            print("Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.\n")
            let mountainOfGolem = MountainOfGolemDungeon()
            mountainOfGolem.start(player: player)
        case "q":
            gameRunning = false
            print("\nThanks for playing! Goodbye, \(player.name)!")
        default:
            print("\nInvalid choice. Please try again.")
        }
    }
}

main()

