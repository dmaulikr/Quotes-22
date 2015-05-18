//
//  AppDelegate.swift
//  Quotes
//
//  Created by Julian Grosshauser on 09/05/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.backgroundColor = .whiteColor()

        let navigationController = UINavigationController(rootViewController: QuotesTableViewController())
        window.rootViewController = navigationController

        return window
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window!.makeKeyAndVisible()

        return true
    }
}

