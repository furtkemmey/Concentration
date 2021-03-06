//
//  ViewController.swift
//  Concentration
//
//  Created by HsuKaiChieh on 08/02/2018.
//  Copyright © 2018 HKC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards: Int {
        return (carButtons.count + 1) / 2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    func updateFlipCountLabel() {
        let attributes: [NSAttributedStringKey:Any] = [
            .strokeWidth : 5.0,
            .strokeColor : UIColor.orange
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipsCountLabel.attributedText = attributedString
    }

    // MARK: - IBOutlet
    @IBOutlet private weak var flipsCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    @IBOutlet private var carButtons: [UIButton]! // buttons array
    
    // MARK: - IBAction
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = carButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    @IBAction func newGameAction(_ sender: UIButton) {
//        game = Concentration(numberOfPairsOfCards: (carButtons.count + 1) / 2)
//        emojiChoices = emojiNewGame //add new emoji
//        updateViewFromModel()
    }
    
    // MARK: - LifeCycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    //update View from Model
    private func updateViewFromModel() {
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
    
//    private var emojiChoices: [String] = ["🎃","👻","🐼","🐧","🐾","🐊","🕷","🦉","🦇"]
    private var emojiChoices = "🎃👻🐼🐧🐾🐊🕷🦉🦇"
    private var emojiNewGame: [String] = ["🎃","👻","🐼","🐧","🐾","🐊","🕷","🦉","🦇"]
    private var emoji = [Card : String]()
    
    // take a random emoji,delete it form array then return
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"// get emoji form dictionary
    }
}
// MARK: extension Int
extension Int { // get random number from zero to self
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
extension ViewController {
    func printLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line){
        #if DEBUG
            debugPrint("Line:\(line) \(method)(): \(message)")
        #else
            print("Line:\(line) \(method)(): \(message)")
        #endif
    }
}

// MARK: - LifeCycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

