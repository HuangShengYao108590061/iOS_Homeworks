//
//  myLab10App.swift
//  myLab10
//
//  Created by Starvian Wibowo on 6/1/22.
//

import SwiftUI
import Firebase

@main
struct myLab10App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            ContentView().environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

