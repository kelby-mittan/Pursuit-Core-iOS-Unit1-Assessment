//
//  main.swift
//  BlackJack
//
//  Created by Alex Paul on 10/15/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

let game = Game()
var playAgain = true

print("Please enter your name!")
let getName = readLine() ?? ""
game.getName(getName)
sleep(1)
print()
print("""
    ██╗     ███████╗████████╗███████╗    ██████╗ ██╗      █████╗ ██╗   ██╗
    ██║     ██╔════╝╚══██╔══╝██╔════╝    ██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝
    ██║     █████╗     ██║   ███████╗    ██████╔╝██║     ███████║ ╚████╔╝
    ██║     ██╔══╝     ██║   ╚════██║    ██╔═══╝ ██║     ██╔══██║  ╚██╔╝
    ███████╗███████╗   ██║   ███████║    ██║     ███████╗██║  ██║   ██║
    ╚══════╝╚══════╝   ╚═╝   ╚══════╝    ╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝
██████╗ ██╗      █████╗  ██████╗██╗  ██╗     ██╗ █████╗  ██████╗██╗  ██╗    ██╗██╗██╗
██╔══██╗██║     ██╔══██╗██╔════╝██║ ██╔╝     ██║██╔══██╗██╔════╝██║ ██╔╝    ██║██║██║
██████╔╝██║     ███████║██║     █████╔╝      ██║███████║██║     █████╔╝     ██║██║██║
██╔══██╗██║     ██╔══██║██║     ██╔═██╗ ██   ██║██╔══██║██║     ██╔═██╗     ╚═╝╚═╝╚═╝
██████╔╝███████╗██║  ██║╚██████╗██║  ██╗╚█████╔╝██║  ██║╚██████╗██║  ██╗    ██╗██╗██╗
╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚═╝╚═╝╚═╝
""")
repeat {
    print("Your starting hand is...")
    sleep(1)
    game.startHand()
    if game.player.score == 21 {
        sleep(1)
        print("\nBLACKJACK 🤑🤑🤑... You Win!!!")
        game.newGame()
        game.hitPlayer = false
    }
    if game.player.score != 21 {
        repeat {
            print("\nPlease select \"hit\" or \"stand\"")
            let userSelection = readLine() ?? ""
            let userSelectionLower = userSelection.lowercased()
        switch userSelectionLower {
        case "hit":
            game.hitMe()
            game.hitPlayer = true
            if game.player.score > 21 {
                sleep(1)
                print("\nUh Oh \(getName)... you Busted!!!")
                game.hitPlayer = false
            } else if game.player.score == 21 {
                sleep(1)
                print("\nBLACKJACK 🤑🤑🤑... Way to go \(getName), you Win!!!")
                game.hitPlayer = false
            }
        case "stand":
            print(game.computerVsPlayer())
            game.hitPlayer = false
        default:
            print("please select \"hit\" or \"pass\"")
        }
            
        } while game.hitPlayer
    }
    var askAgain = true
    while askAgain == true {
        print("\nWould you like to play again \"yes\" or \"no\"")
        let playAgainAsk = readLine() ?? ""
        let playAgainAskLower = playAgainAsk.lowercased()
        if playAgainAskLower == "yes" {
            game.newGame()
            askAgain = false
        } else if playAgainAskLower == "no" {
            print("\nThanks for playing!!!")
            playAgain = false
            askAgain = false
        } else {
            print("\nPlease enter \"yes\" or \"no\"")
            askAgain = true
        }
    }
    

} while playAgain
