//
//  AppDelegate.swift
//  BasketPrice
//
//  Created by Daniel Vela on 10/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import UIKit
import QuartzCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let navigationController = window?.rootViewController as? UINavigationController,
            let goodListVC = navigationController.topViewController as? GoodListTableViewController {
            if let goodList = GoodList.load() {
                let basket = Basket()
                goodListVC.viewModel = GoodListViewModel(data: goodList, basket: basket)
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
