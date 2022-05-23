//
//  GameViewController.swift
//  finger_guessing_game
//
//  Created by Starvian Wibowo on 2022/5/25.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var playerFinger: Finger?
    @Published var computerFinger: Finger?
    @Published var gameState: GameState?
    
    var fingers: [Finger] = {
        var fingers = [Finger]()
        for fingerType in Finger.FingerType.allCases {
            fingers.append(Finger(type: fingerType))
        }
        return fingers
    }()

    init() {
        self.playerFinger = Finger(type: .stone)
        self.computerFinger = Finger(type: .stone)
    }

    func play() {
        self.playerFinger = fingers.randomElement()
        self.computerFinger = fingers.randomElement()
        self.gameState = self.checkState()
    }

    private func checkState() -> GameState? {
        let computerFinger = self.computerFinger?.type
        let playerFinger = self.playerFinger?.type
        
        if computerFinger == playerFinger {
            return .equal
        }

        switch playerFinger {
            case .paper:
                return computerFinger == .stone ? .win : .lose
            case .scissor:
                return computerFinger == .paper ? .win : .lose
            case .stone:
                return computerFinger == .scissor ? .win : .lose
            case .none:
                return nil
        }
    }
}
