//
//  Card.swift
//  cardGame
//
//  Created by starvian on 2022/4/11.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var iconIndex: Int
    
    static var iconIndexFactory = 0
    static func getUniqueIndex() -> Int {
        iconIndexFactory += 1
        return iconIndexFactory
    }
    
    init(iconIndex: Int) {
        self.iconIndex = Card.getUniqueIndex()
    }
}
