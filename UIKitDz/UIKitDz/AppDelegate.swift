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

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let loginVC = LoginViewController()
        window?.rootViewController = loginVC
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }
}
