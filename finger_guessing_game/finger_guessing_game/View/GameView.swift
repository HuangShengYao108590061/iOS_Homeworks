//
//  GameView.swift
//  finger_guessing_game
//
//  Created by Starvian Wibowo on 2022/5/25.
//

import SwiftUI

struct GameView: View {
    @StateObject var gameViewModel: GameViewModel = GameViewModel()
    
    var body: some View {
        VStack (alignment: .center) {
            Text("猜拳遊戲")
                .font(.largeTitle)
            HStack {
                Text("Player：  ")
                    .font(.title)
                Label {
                    Text(gameViewModel.playerFinger?.name ?? "Stone")
                        .font(.title)
                } icon: {
                    Image(gameViewModel.playerFinger?.type.rawValue ?? "stone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
            }
            HStack {
                Text("Computer：  ")
                    .font(.title)
                Label {
                    Text(gameViewModel.computerFinger?.name ?? "Stone")
                        .font(.title)
                } icon: {
                    Image(gameViewModel.computerFinger?.type.rawValue ?? "stone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
            }
            
            Button(action: {
                gameViewModel.play()
            }, label: {
                ZStack {
                    Text("Start！")
                    Image("paperscissorstone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
            })
            
            HStack {
                Text("Result：  ")
                    .font(.system(size: 20))
                if let result = gameViewModel.gameState {
                    Text(result == .win ? "Player Wins！" : result == .lose ? "Player lose！" : "Draw！")
                        .font(.system(size: 20))
                        .foregroundColor(.red)
                }
                else {
                    Text("Please press start to start the game")
                        .font(.system(size: 20))
                        .foregroundColor(.red)
                }
            }
            .padding()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
