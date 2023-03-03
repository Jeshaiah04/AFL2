//
//  main.swift
//  AFL1
//  Jeshaiah Jesse
//  0706012110015
//  Created by MacBook Pro on 03/03/23.
//

import Foundation

let OpeningScreen = """
Welcome to the world of magic! 🦄🧝🏻‍♀️

You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests 🌲, mountains 🏔️, and dungeons 🏯, where you will face challenges, make allies, and fight enemies 🧌!

Press [return] to continue :
"""

print(OpeningScreen)

// Character Constant Status
let MAX_HEALTH = 100
let MAX_STAMINA = 100
let MAX_ATTACK = 20
let MAX_DEFENSE = 10
let MAX_SKILL_POINTS = 5

// Character Stats Variable
var playerName = ""
var playerHealth = MAX_HEALTH
var playerStamina = MAX_STAMINA
var playerAttack = 10
var playerDefense = 5
var playerSkillPoints = MAX_SKILL_POINTS

// Variable For Game State
var isGameOver = false
var numMonsterDefeated = 0


while true {
    let userOpeningInput = readLine() ?? ""
    
    if userOpeningInput == "" {
        break
    } else {
        print("")
        print(OpeningScreen)
        
        
    }
}


