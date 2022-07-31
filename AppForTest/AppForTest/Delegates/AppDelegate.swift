//
//  AppDelegate.swift
//  AppForTest
//
//  Created by мас on 21.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let nav1 = UINavigationController()
        let mainView = HomeViewController(nibName: nil, bundle: nil)
        nav1.viewControllers = [mainView]
        window?.rootViewController = nav1
        window?.makeKeyAndVisible()

        return true
    }
    
}

