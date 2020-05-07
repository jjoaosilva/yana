//
//  AppDelegate.swift
//  Yana
//
//  Created by Pedro Sousa on 23/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let launcheBefore = UserDefaults.standard.bool(forKey: "hasLaunched")
        window = UIWindow(frame: UIScreen.main.bounds)
        let launchStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let loginStoryboard = UIStoryboard(name: "Login", bundle: nil)

        if launcheBefore {
            window?.rootViewController = loginStoryboard.instantiateInitialViewController()!
        } else {
            //OnboardingViewControllerID
            window?.rootViewController = launchStoryboard.instantiateInitialViewController()!
        }

        if #available(iOS 13, *), launcheBefore != true {
            UserDefaults.standard.set(false, forKey: "hasLaunched")
        } else {
            UserDefaults.standard.set(true, forKey: "hasLaunched")
        }
        window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
