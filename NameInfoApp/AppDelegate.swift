//
//  AppDelegate.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let controller = NameViewController()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        
        return true
    }
}

