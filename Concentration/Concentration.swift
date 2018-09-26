//
//  Concentration.swift
//  Concentration
//
//  Created by illiant on 2018/9/25.
//  Copyright © 2018 illiant. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards = shuffleArray(arr: cards)
    }
    
    
    
    func chooseCard (at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipIndex in cards.indices {
                    cards[flipIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    func shuffleArray(arr: [Card]) -> [Card] {
        var data: [Card] = arr
        for i in 1..<arr.count {
            let index: Int = Int(arc4random()) % i
            if index != i {
                data.swapAt(i, index)
            }
        }
        
        return data
    }
}
