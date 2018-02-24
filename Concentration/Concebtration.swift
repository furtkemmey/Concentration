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
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    // check choosed card status
    func chooseCard(at index: Int) {// choosed card index
        if !cards[index].isMatched {// is not matched
            // one card face up, has value and not it self
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards is match
                if cards[matchIndex].identifier == cards[index].identifier {//check two cards are the same
                    cards[matchIndex].isMatched = true //set to matched
                    cards[index].isMatched = true
                }
                cards[index].isFaceUP = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either one cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUP = false
                }
                cards[index].isFaceUP = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }// if !cards[index].isMatched
    }
    init(numberOfPairsOfCards: Int) {
//        for _ in 1...numberOfPairsOfCards {
//            let card = Card()
//            cards += [card, card]
//        }
        
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]// add two cards are the same identifier
        }
        for _ in 1...numberOfPairsOfCards * 2 {
            let randomIndex = Int(arc4random_uniform(UInt32(numberOfPairsOfCards * 2)))
            let removedCard = cards.remove(at: randomIndex)// remove random card
            cards.append(removedCard)// append to cards
        }
    }
    
}
