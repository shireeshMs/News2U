//
//  AppDelegate.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
//    private final var coordinator: ConcreteCoordinator!
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        setupMainCoordinator()
        return true
    }

    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
//    private final func setupMainCoordinator() {
//        let navigationController: UINavigationController = UINavigationController()
//
//        coordinator = ConcreteCoordinator(navigationController: navigationController)
//
//        window = UIWindow()
//        window?.backgroundColor = .white
//        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
//
//        coordinator.start()
//    }

}

