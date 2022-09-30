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
        window = UIWindow()
        navController = UINavigationController(rootViewController: LoginViewController())
        window?.rootViewController = navController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }
}
