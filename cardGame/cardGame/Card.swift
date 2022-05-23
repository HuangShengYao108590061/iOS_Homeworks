//
//  Card.swift
//  cardGame
//
//  Created by starvian on 2022/4/11.
//

import Foundation

struct Card:Hashable {
    var hashValue: Int{
        return iconIndex
    }
    static func ==(lhs: Card, rhs: Card)-> Bool{
        return lhs.iconIndex == rhs.iconIndex
    }
    
    var isFaceUp = false
    var isMatched = false
    private var iconIndex: Int
    
    static var iconIndexFactory = 0
    static func getUniqueIndex() -> Int {
        iconIndexFactory += 1
        return iconIndexFactory
    }
    
    init(iconIndex: Int) {
        self.iconIndex = Card.getUniqueIndex()
    }
}
