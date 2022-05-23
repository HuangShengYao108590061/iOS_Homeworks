//
//  User.swift
//  finger_guessing_game
//
//  Created by Starvian Wibowo on 2022/5/25.
//

import Foundation

struct Finger {
    let type: FingerType
    var name: String {
        get {
            switch type {
                case .paper:
                    return "Paper"
                case .scissor:
                    return "Scissor"
                case .stone:
                    return "Rock"
            }
        }
    }

    enum FingerType: String, CaseIterable {
        case paper = "paper"
        case scissor = "scissor"
        case stone = "stone"
    }
}
