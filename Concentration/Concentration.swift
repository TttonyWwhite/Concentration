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
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
    
    // TODO Shuffle the cards
    
    func chooseCard (at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
}
