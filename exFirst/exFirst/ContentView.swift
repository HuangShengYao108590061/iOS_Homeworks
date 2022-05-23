//
//  ContentView.swift
//  exFirst
//
//  Created by Starvian Wibowo on 5/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {

            VStack(spacing: 10) {
                
                Image("accs").resizable()
                    .frame(width: 100,height: 100)
                Text("Health Sharing")
                    .fontWeight(.bold)
                    .font(.system(size:30))
                    .multilineTextAlignment(.center)
                    .font(Font.body.bold())
                    .padding()
        
                VStack(alignment: .leading, spacing: 20){
                HStack(){
                    Image("remo").resizable()
                        .frame(width: 75,height: 75)
                    VStack(alignment: .leading, spacing: 6){
                            Text("You're in Control")
                            .font(.system(size:18))
                            .fontWeight(.bold)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                        Text("Keep friends and family up to date on how you're doing by securely sharing your Health data.").foregroundColor(Color.gray).multilineTextAlignment(.leading)
                    }
                    
                }
                
                HStack(){
                    Image("notif").resizable()
                        .frame(width: 75,height: 75)
                    VStack(alignment: .leading, spacing: 6){
                            Text("Dashboard and Notifications")
                            .font(.system(size:18))
                            .fontWeight(.bold)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                        Text("Data you share will appear in their Health app. They can also get notifications if there's an update.").foregroundColor(Color.gray).multilineTextAlignment(.leading)
                    }
                    
                }
                
                HStack(){
                    Image("locks").resizable()
                        .frame(width: 75,height: 75)
                    VStack(alignment: .leading, spacing: 6){
                            Text("Private and Secure")
                            .font(.system(size:18))
                            .fontWeight(.bold)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                        Text("Only a summary of each topic is shared, not the details. The information is encrypted and you can stop sharing at any time.").foregroundColor(Color.gray).multilineTextAlignment(.leading)
                    }
                    
                }
            }

                VStack {
                  }
                Button(action: {print("Share with Someone")}) {
                    Text("Share with Someone").fontWeight(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
                        .font(.system(size:18))
                        .frame(width: 225.0, height: 30.0)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
            }
        }
    }
}

struct ContentView2: View {
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
            Button(action: {print("Get Started")}) {
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
        ContentView2()
    }
}
