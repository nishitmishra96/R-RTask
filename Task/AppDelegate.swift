//
//  AppDelegate.swift
//  Task
//
//  Created by Vikas on 23/09/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        let startingVC = Storyboard.Main.instanceOf(viewController: ViewController.self)!
        let navigationController = UINavigationController.init(rootViewController: startingVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }


}

