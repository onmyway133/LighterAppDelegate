//
//  AppDelegate.swift
//  LighterAppDelegate
//
//  Created by Khoa Pham on 01/16/2016.
//  Copyright (c) 2016 Khoa Pham. All rights reserved.
//

import UIKit
import LighterAppDelegate

/*
// Inheritance
@UIApplicationMain
class AppDelegate: UIResponder, LighterAppDelegate {

    var window: UIWindow?
    let simpleDispatcher = Dispatcher(services: [RootService()])

    func dispatcher() -> Dispatcher {
        return simpleDispatcher
    }

    func applicationDidReceiveMemoryWarning(application: UIApplication) {
        dispatcher().applicationDidReceiveMemoryWarning(application)
    }
}
*/

// Composition
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let dispatcher = Dispatcher(services: [RootService()])

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        return dispatcher.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}