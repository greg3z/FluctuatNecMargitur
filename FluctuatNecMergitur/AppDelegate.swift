//
//  AppDelegate.swift
//  FluctuatNecMergitur
//
//  Created by Grégoire Lhotellier on 02/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit
import Coordinator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var router: Router?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        let windowCoordinator = WindowCoordinator(window: window)
        router = Router(windowCoordinator: windowCoordinator)
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

