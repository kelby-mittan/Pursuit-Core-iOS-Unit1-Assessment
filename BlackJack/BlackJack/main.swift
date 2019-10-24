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
    
    repeat {
        print("\nPlease select \"hit\" or \"pass\"")
        let userSelection = readLine() ?? ""
        let userSelectionLower = userSelection.lowercased()
    switch userSelectionLower {
    case "hit":
        game.hitMe()
        game.hitPlayer = true
        if game.player.score > 21 {
            print("\nBIG OLD BUST")
            game.hitPlayer = false
        } else if game.player.score == 21 {
            print("\nBLACKJACK 🤑🤑🤑... You Win!!!")
            game.hitPlayer = false
        }
    case "pass":
        print(game.computerVsPlayer())
        game.hitPlayer = false
    default:
        print("please select \"hit\" or \"pass\"")
    }
        
    } while game.hitPlayer

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
