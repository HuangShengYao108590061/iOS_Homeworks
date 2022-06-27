//
//  ContentView.swift
//  lab09
//
//  Created by Starvian Wibowo on 5/25/22.
//

import SwiftUI

class GameSettings: ObservableObject {
    @Published var score = 0
}

// A view that expects to find a GameSettings object
// in the environment, and shows its score.
struct ScoreView: View {
    @EnvironmentObject var settings: GameSettings

    var body: some View {
        Text("Score: \(settings.score)")
    }
}

// A view that creates the GameSettings object,
// and places it into the environment for the
// navigation view.
struct ContentView: View {
    @StateObject var settings = GameSettings()

    var body: some View {
        NavigationView {
            List{
                Text("Movie 1")
                Text("Movie 2")
                Text("Movie 3")
            }
            VStack {
                // A button that writes to the environment settings
                Button("Increase Score") {
                    settings.score += 1
                }

                NavigationLink(destination: ScoreView()) {
                    Text("Show Detail View")
                }
            }
            .frame(height: 200)
        }
        .environmentObject(settings)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
