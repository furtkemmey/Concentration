//
//  Card.swift
//  Concentration
//
//  Created by HsuKaiChieh on 11/02/2018.
//  Copyright © 2018 HKC. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUP = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    static func getuniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    init() {
        self.identifier = Card.getuniqueIdentifier()
    }
}
