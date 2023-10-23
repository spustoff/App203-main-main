//
//  App203App.swift
//  App203
//
//  Created by IGOR on 30/09/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_4GJXYyb2LJ1raNptEka76gnGHwfrBP")
        Amplitude.instance().initializeApiKey("0a63a132ff42e090b0db099f44ec998a")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App203App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
