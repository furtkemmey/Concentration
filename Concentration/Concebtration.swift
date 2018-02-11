//
//  Concebtration.swift
//  Concentration
//
//  Created by HsuKaiChieh on 11/02/2018.
//  Copyright © 2018 HKC. All rights reserved.
//

import Foundation

class Concentration {
    var cards: Array<Card> = [Card]()
    
    func chooseCard(at index: Int) {
        if cards[index].isFaceUP {
           cards[index].isFaceUP  = false
        } else {
            cards[index].isFaceUP  = true
            
        }
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
             cards += [card, card]
        }
    }
    
}
