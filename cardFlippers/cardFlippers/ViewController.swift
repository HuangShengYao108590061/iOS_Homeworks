//
//  ViewController.swift
//  cardFlippers
//
//  Created by starvian on 3/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipCnt: UILabel!
    
    let flipCardsClr = UIColor.blue
    let unflipCardsClr = UIColor.cyan
    
    var flipCount:Int = 0{
        didSet{
            flipCnt.text = "\(flipCount)"
        }
    }
    //var emojiChoices = ["👻","🎃","👽","✌️"]
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


}

