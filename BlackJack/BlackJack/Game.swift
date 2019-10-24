//
//  Game.swift
//  BlackJack
//
//  Created by Kelby Mittan on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    var deck = Card.newDeck(aceValue: 11) //[Card] ()
    
    var player = Player()
    
    var hitPlayer = Bool()
        
    var hasMoreCards: Bool {
        return !deck.isEmpty
    }
    
    var randomComputerScore: Int {
        return Int.random(in: 17...27)
    }
    
    var compScore = Int()
    
    var cardArr = [String]()
    
    func getName(_ name: String) {
        player.playerName = name
        print("Welcome \(name).....")
        for _ in 1...3 {
            sleep(1)
            print("🔀🔀🔀🔀🔀🔀🔀🔀🔀🔀🔀")
            print("🃏🃏🃏🃏🃏🃏🃏🃏🃏🃏🃏")
        }
    }

    func hitMe() {
        deck = deck.shuffled()
        if let validCard = deck.popLast() {
            player.score = player.score + validCard.value
            cardArr.append(validCard.stringify().description)
            for card in cardArr {
                print(card, terminator: " ")
            }
            
            print("... Your current score is \(player.score)")
        }
    }
    

    func stopHits() -> Int {
        compScore = randomComputerScore
        return compScore
    }

    func computerVsPlayer() -> String {
        var winOrLose = String()
        compScore = randomComputerScore
        switch compScore {
        case 21:
            winOrLose = "Sorry \(player.playerName), you lost... you got \(player.score) and the computer got Blackjack"
        case 17...20:
            if player.score > compScore && player.score < 22 {
                winOrLose = "Way to go \(player.playerName), you won... you got \(player.score) to the computer's \(compScore)"
            } else {
                winOrLose = "Sorry \(player.playerName), you lost... you got \(player.score) to the computer's \(compScore)"
            }
        case 22...27:
            winOrLose = "Way to go \(player.playerName), you won... you got \(player.score) and the computer Busted with \(compScore)"
        default:
            winOrLose = "error"
        }
        return winOrLose
    }
    
    
    func newGame() {
        player.score = 0
        hitPlayer = true
        cardArr.removeAll()
        
    }
    
}
