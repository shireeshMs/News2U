//
//  SceneDelegate.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private final var coordinator: ConcreteCoordinator!


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        let navigationController: UINavigationController = UINavigationController()

        coordinator = ConcreteCoordinator(navigationController: navigationController)
        
        let win  = UIWindow(windowScene: winScene)
        win.backgroundColor = .white
        win.rootViewController = navigationController
        win.makeKeyAndVisible()
        window = win
        
                
        guard let _ = (scene as? UIWindowScene) else { return }
        coordinator.start()
    }
    private final func setupMainCoordinator() {
        let navigationController: UINavigationController = UINavigationController()

        coordinator = ConcreteCoordinator(navigationController: navigationController)

        window = UIWindow()
        window?.backgroundColor = .white
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        coordinator.start()
    }
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

