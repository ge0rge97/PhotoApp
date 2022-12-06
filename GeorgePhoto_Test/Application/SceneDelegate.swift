//
//  SceneDelegate.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 29.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let tabBarController = BaseTabBarController()

        guard let windowScene = (scene as? UIWindowScene) else { return  }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

