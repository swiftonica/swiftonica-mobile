//
//  AppDelegate.swift
//  ProjectS
//
//  Created by Jeytery on 28.11.2022.
//

import UIKit

// Swiftonica fuv1

// - convertor
// - markdown view
// - base ui of openscape that shows all content

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        API().getSwitonica {
            swiftonica in
         
            self.window?.rootViewController = UINavigationController(
                rootViewController: OpenspaceViewController(openspace: swiftonica)
            )
            self.window?.makeKeyAndVisible()
        }
        return true
    }
}
