//
//  calcItems.swift
//  midtermProject_Calculator
//
//  Created by Starvian Wibowo on 4/22/22.
//

import Foundation

struct calcItems<Element> {
    private var items = [Element]()
    mutating func push(item:Element) {
        items.append(item)
    }
    mutating func pop() ->Element? {
        return items.removeLast()
    }
    func empty() -> Bool {
        return items.isEmpty
    }
    func peek() ->Element? {
        return items.last
    }
    func count() -> Int! {
        return items.count
    }
}
