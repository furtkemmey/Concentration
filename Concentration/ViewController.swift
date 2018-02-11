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
            flipsCountLabel.text = "Flips:\(flipCount)"
        }
    }
    var emojiChoices = ["🎃","👻","🎃","👻"]

    @IBOutlet weak var flipsCountLabel: UILabel!
    @IBOutlet var carButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = carButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
        } else {
            print("chosen card was not in cardButtons")
        }
//        flipCard(withEmoji: "👻", on: sender)
    }
//    func flipCard(withEmoji emoji: String, on button: UIButton) {
//        if button.currentTitle == emoji {
//            button.setTitle("", for: .normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//        } else {
//            button.setTitle(emoji, for: .normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        }
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
    func emoji(for card: Card) -> String {
        return "?"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

