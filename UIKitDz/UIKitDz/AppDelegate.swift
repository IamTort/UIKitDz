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
        window = UIWindow(frame: UIScreen.main.bounds)
        let firstVC = ChangeTextViewController()
        let firstNavController = UINavigationController(rootViewController: firstVC)
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([firstNavController], animated: true)
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
        return true
    }
}
