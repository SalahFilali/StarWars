//
//  AppDelegate.swift
//  StarWars
//
//  Created by Salah Filali on 21/01/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let appContainer = AppDependenciesContainer()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appContainer.makeMainViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

