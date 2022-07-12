//
//  AppDelegate.swift
//  VKServices
//
//  Created by Alex Ch. on 12.07.2022.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let tableViewController = MainTableTableViewController()
        window.rootViewController = tableViewController
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
    
}


