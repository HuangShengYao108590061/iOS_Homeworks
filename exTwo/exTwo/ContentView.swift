//
//  ContentView.swift
//  exTwo
//
//  Created by Starvian Wibowo on 5/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
                Image("news")
                            .resizable()
                            .scaledToFit()
                    VStack {
                        Text("🍎News+")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                        Text("Great News!")
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        Text("Audio Stories are here")
                            .fontWeight(.bold)
                            .foregroundColor(Color.pink)
                        Text("Listen only in Apple News+.")
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        }
                        .font(.title)
                        .padding()

            VStack(spacing: 9){
            Button(action: {print("Hi")}) {
                Text("Get Started").fontWeight(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
                    .font(.system(size:18))
                    .frame(width: 375.0, height: 37.0)
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            
            Text("Plan auto-renews for $9.99/month until canceled.")
                .font(.system(size:15))
                .foregroundColor(Color.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
