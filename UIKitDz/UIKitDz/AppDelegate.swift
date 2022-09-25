//
//  AppDelegate.swift
//  UIKitDz
//
//  Created by angelina on 23.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navController: UINavigationController = UINavigationController()
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow()
        self.navController = UINavigationController(rootViewController: ViewController())
        self.window?.rootViewController = navController
        self.window?.backgroundColor = .white
        self.window?.makeKeyAndVisible()
        return true
    }
}
