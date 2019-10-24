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

repeat {
    repeat {
        print("Please select \"hit\" or \"pass\"")
        let userSelection = readLine() ?? ""
        let userSelectionLower = userSelection.lowercased()
    switch userSelectionLower {
    case "hit":
        game.hitMe()
        game.hitPlayer = true
        if game.player.score > 21 {
            print("BIG OLD BUST")
            game.hitPlayer = false
        } else if game.player.score == 21 {
            print("BLACKJACK... You Win!!!")
            game.hitPlayer = false
        }
    case "pass":
        print(game.stopHits())
        print(game.computerVsPlayer())
        game.hitPlayer = false
    default:
        print("please select \"hit\" or \"pass\"")
    }
        
    } while game.hitPlayer



    print("Would you like to play again \"yes\" or \"no\"")
    let playAgainAsk = readLine() ?? ""
    let playAgainAskLower = playAgainAsk.lowercased()
    if playAgainAskLower == "yes" {
        game.newGame()
    } else {
        print("Thanks for playing!!!")
        playAgain = false
    }

} while playAgain
