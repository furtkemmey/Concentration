//
//  ViewController.swift
//  Concentration
//
//  Created by HsuKaiChieh on 08/02/2018.
//  Copyright © 2018 HKC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (carButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipsCountLabel.text = "Flips: \(flipCount)"
        }
    }

    // MARK: - IBOutlet
    @IBOutlet weak var flipsCountLabel: UILabel!
    @IBOutlet var carButtons: [UIButton]! // buttons array
    
    // MARK: - IBAction
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = carButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    @IBAction func newGameAction(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (carButtons.count + 1) / 2)
        emojiChoices = emojiNewGame //add new emoji
        updateViewFromModel()
    }
    
    // MARK: - LifeCycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    //update View from Model
    func updateViewFromModel() {
        for index in carButtons.indices {
            let button = carButtons[index]
            let card = game.cards[index]
            if card.isFaceUP {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) :  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🎃","👻","🐼","🐧","🐾","🐊","🕷","🦉","🦇"]
    var emojiNewGame = ["🎃","👻","🐼","🐧","🐾","🐊","🕷","🦉","🦇"]
    var emoji = [Int : String]()
    
    // take a random emoji,delete it form array then return
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}
// MARK: - LifeCycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

