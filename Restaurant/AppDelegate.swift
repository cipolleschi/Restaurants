//
//  AppDelegate.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 17/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var dependencies: Dependencies!
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow()
        self.window = window
        self.dependencies = Dependencies(window: window)
        let rootCoordinator = RootCoordinator(dependencies: dependencies)
        rootCoordinator.start()
        window.makeKeyAndVisible()
        return true
    }


}

