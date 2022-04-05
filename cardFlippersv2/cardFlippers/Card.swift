//
//  Card.swift
//  cardFlippers
//
//  Created by starvian on 3/16/22.
//

import Foundation

struct Card : Hashable{
    
    var isFaceUp = false;
    var isMatched = false;
    private var identifier: Int;

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier);
    }

    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier;
    }

    static var identifierFactory: Int = 0;
    
    static func getUniqueIdentifier() -> Int {
        self.identifierFactory += 1;
        return self.identifierFactory;
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier();
    }
    
}
