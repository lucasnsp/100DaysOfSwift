//
//  CardController.swift
//  Memory Match
//
//  Created by Lucas Neves dos santos pompeu on 07/08/23.
//

import Foundation
import UIKit

class CardController {
    
    static func fetchCards() -> [Card] {
        
        var cards: [Card] = []
        var usedNumbers: [Int] = []
        
        while usedNumbers.count < 4 {
            
            let randomNumber = Int.random(in: 1...4)
            
            if !usedNumbers.contains(randomNumber) {
                let card1 = Card(name: "card\(randomNumber)")
                cards.append(card1)
                let card2 = Card(name: "card\(randomNumber)")
                cards.append(card2)
                
                usedNumbers.append(randomNumber)
            }
        }
         return cards.shuffled()
    }
}
