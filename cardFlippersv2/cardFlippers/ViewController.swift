//
//  ViewController.swift
//  cardFlippers
//
//  Created by starvian on 3/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    // lazy variable dont have observers
    lazy var game = MatchingGame(numberOfPairsOfCards: (cardButtons.count + 1) / 2);
    
    var emojis = ["😂", "🤣", "❤️", "😼", "🙏", "👐", "🤝", "💄", "👤", "🏃🏽", "👬", "💅", "🥂", "🍻", "🧂", "🍭"];
    var emojiDict: Dictionary<Card, String> = [Card:String]();

    var flipState: Bool = false;

    @IBOutlet weak var flipButton: UIButton!

    @IBOutlet weak var flipCounter: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet var cardButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.flipButton.layer.cornerRadius = 10;
        self.flipButton.layer.borderWidth = 0.5;
        self.flipCounter.text = "0";
        self.updateViewFromModel();
    }

    @IBAction func flip(_ sender: UIButton) {
        let index = cardButtons.firstIndex(of: sender);
        print("cardNumber = \(String(describing: index!))");

        self.game.chooseCard(at: index!);

        self.updateViewFromModel();
    }

    @IBAction func flipAll(_ sender: UIButton) {
        if self.game.isAllCardsSameState(state: !flipState) {
            flipState = !flipState;
        }
        self.game.flipAll(state: flipState);
        self.updateViewFromModel();
        flipState = !flipState;
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index];
            let card = game.getCard(at: index);
            if card.isFaceUp || card.isMatched {
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.2316158334, green: 0.2316158334, blue: 0.2316158334, alpha: 0.5) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
                button.setTitle(self.emoji(for: card), for: UIControl.State.normal);
            } else {
                button.backgroundColor = #colorLiteral(red: 0.463617444, green: 0.9779338241, blue: 0.9851465821, alpha: 1);
                button.setTitle("", for: UIControl.State.normal);
            }
        }
        
        flipCounter.text = String(game.getCount());
        scoreCounter.text = String(game.getScore());
    }

    func emoji(for card: Card) -> String {
        if self.emojiDict[card] == nil && !self.emojis.isEmpty {
            let randomIndex = Int(arc4random_uniform(UInt32(self.emojis.count)));
            self.emojiDict[card] = self.emojis[randomIndex];
            self.emojis.remove(at: randomIndex);
        }

        return self.emojiDict[card] ?? "?";
    }

    @IBAction func reset(_ sender: UIButton) {
        self.game.reset();
        self.updateViewFromModel();
    }
    
    
    
    
    
    /*
    @IBOutlet weak var flipCnt: UILabel!
    
    let flipCardsClr = UIColor.blue
    let unflipCardsClr = UIColor.cyan
    
    var game:MatchingGame
    
    var flipCount:Int = 0{
        didSet{
            flipCnt.text = "\(flipCount)"
        }
    }
    //var emojiChoices = ["👻","🎃","👽","✌️","","","","",""]
    //@IBOutlet var cardBtns: [UIButton]!

    @IBAction func ghost1(_ sender: UIButton) {
        if sender.backgroundColor == flipCardsClr {
            sender.setTitle("", for: UIControl.State.normal)
            sender.backgroundColor = unflipCardsClr
        }
        else{
        switch sender.tag{
        case 1:
            sender.setTitle("👻", for: UIControl.State.normal)
        case 2:
            sender.setTitle("🎃", for: UIControl.State.normal)
        case 3:
            sender.setTitle("👽", for: UIControl.State.normal)
        case 4:
            sender.setTitle("✌️", for: UIControl.State.normal)
        default:
            break
        }
        sender.backgroundColor = flipCardsClr
        sender.titleLabel?.font = .systemFont(ofSize: 61)
        }
        flipCount += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

*/
}

