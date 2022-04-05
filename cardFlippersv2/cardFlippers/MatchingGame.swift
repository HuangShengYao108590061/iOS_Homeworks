//
//  MatchingGame.swift
//  cardFlippers
//
//  Created by starvian on 3/16/22.
//

import Foundation

class MatchingGame{
    private var cards: Array<Card> = Array();

    private var counter: Int = 0;
    
    private var score: Int = 0;

    private var indexOfOneAndOnlyFaceUp: Int? {
        get {
            var foundIndex: Int?;
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index;
                    }
                    else {
                        return nil;
                    }
                }
            }
            return foundIndex;
        }

        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue);
            }
        }
    }

    public func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUp {
                if matchIndex != index {
                    if cards[matchIndex] == cards[index] {
                        cards[matchIndex].isMatched = true;
                        cards[index].isMatched = true;
                        self.score += 5;
                    }
                    else {
                        self.score -= 1;
                    }
                    cards[index].isFaceUp = true;
                }
                else {
                    cards[index].isFaceUp = false;
                    self.score -= 1;
                }
            }
            else {
                indexOfOneAndOnlyFaceUp = index;
                self.score -= 1;
            }
    
            self.counter += 1;
        }
    }
    public func getScore() -> Int {
        return self.score;
    }
    public func getCount() -> Int {
        return self.counter;
    }
    public func reset() {
        for i in cards.indices {
            cards[i].isFaceUp = false;
            cards[i].isMatched = false;
            indexOfOneAndOnlyFaceUp = nil;
        }
        cards.shuffle();
        self.score = 0;
        self.counter = 0;
    }
    public func getCard(at index: Int) -> Card {
        return cards[index];
    }
    public func flipAll(state: Bool) {
        for index in cards.indices {
            if !cards[index].isMatched {
                if !state && !cards[index].isFaceUp {
                    cards[index].isFaceUp = !cards[index].isFaceUp;
                }
                else if state && cards[index].isFaceUp {
                    cards[index].isFaceUp = !cards[index].isFaceUp;
                }
            }
        }
    }
    public func isAllCardsSameState(state: Bool) -> Bool {
        return cards.allSatisfy({ $0.isFaceUp == state });
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card();
            // copy-on-write semantic, copy by value only happens in changing value
            // self.cards.append(card);
            // self.cards.append(card);
            cards += [card, card];
        }
        cards.shuffle();
        indexOfOneAndOnlyFaceUp = nil;
    }
}
