//
//  Card.swift
//  Concentration
//
//  Created by HsuKaiChieh on 11/02/2018.
//  Copyright © 2018 HKC. All rights reserved.
//

import Foundation

struct Card: Hashable {
    // MARK: - Hashable
    var hashValue: Int {
        return identifier
    }
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUP = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    private static func getuniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    init() {
        self.identifier = Card.getuniqueIdentifier()
    }
}
