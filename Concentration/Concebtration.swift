//
//  Concebtration.swift
//  Concentration
//
//  Created by HsuKaiChieh on 11/02/2018.
//  Copyright © 2018 HKC. All rights reserved.
//

import Foundation

struct Concentration {
    private(set) var cards: Array<Card> = [Card]()
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUP }.oneAndOnly
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUP {
//                    if foundIndex == nil {
//                        foundIndex = index // get first one face up
//                    } else {
//                        return nil // found second card face up, return nil
//                    }
//                }
//            }
//            return foundIndex // only one card be found, return index
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUP = (index == newValue)
            }
        }
    }
    // check choosed card status
    mutating func chooseCard(at index: Int) {// choosed card index
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not int the cards")
        if !cards[index].isMatched {// is not matched
            // one card face up, has value and not it self
            if let matchIndex = indexOfTheOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards is match
                if cards[matchIndex] == cards[index] {//check two cards are the same
                    cards[matchIndex].isMatched = true //set to matched
                    cards[index].isMatched = true
                }
                cards[index].isFaceUP = true
            } else {
                // either one cards or 2 cards are face up
                indexOfTheOneAndOnlyFaceUpCard = index
            }
        }// if !cards[index].isMatched
    }
    init(numberOfPairsOfCards: Int) {
    assert(numberOfPairsOfCards > 0, "Concentration.init(at: \(numberOfPairsOfCards)): you must have at least one pair of cards")
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
extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
