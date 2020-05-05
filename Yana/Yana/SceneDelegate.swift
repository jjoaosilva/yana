//
//  SceneDelegate.swift
//  Yana
//
//  Created by Pedro Sousa on 23/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let launcheBefore = UserDefaults.standard.bool(forKey: "hasLaunched")
        let launchStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let loginStoryboard = UIStoryboard(name: "Login", bundle: nil)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            if launcheBefore {
                window.rootViewController = loginStoryboard.instantiateInitialViewController()!
            } else {
                window.rootViewController = launchStoryboard.instantiateInitialViewController()!
            }
            UserDefaults.standard.set(true, forKey: "hasLaunched")
            self.window?.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
