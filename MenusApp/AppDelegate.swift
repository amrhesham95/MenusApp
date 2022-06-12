//
//  AppDelegate.swift
//  MenusApp
//
//  Created by Amr Hesham on 01/06/2022.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIHostingController(rootView: UniversitiesView(viewModel: DIContainer.getViewModel()))
        window?.makeKeyAndVisible()
        return true
    }

}

