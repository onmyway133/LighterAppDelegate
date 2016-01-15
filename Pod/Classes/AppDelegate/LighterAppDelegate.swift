//
//  LighterAppDelegate.swift
//  Pods
//
//  Created by Khoa Pham on 1/16/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public protocol LighterAppDelegate: UIApplicationDelegate {
    func dispatcher() -> Dispatcher
}

public extension LighterAppDelegate {
    // MARK: AppStateChanges
    public func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        return dispatcher().application(application, willFinishLaunchingWithOptions: launchOptions)
    }

    public func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        return dispatcher().application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    public func applicationDidFinishLaunching(application: UIApplication) {
        dispatcher().applicationDidFinishLaunching(application)
    }

    public func applicationDidBecomeActive(application: UIApplication) {
        dispatcher().applicationDidBecomeActive(application)
    }

    public func applicationWillResignActive(application: UIApplication) {
        dispatcher().applicationWillResignActive(application)
    }

    public func applicationDidEnterBackground(application: UIApplication) {
        dispatcher().applicationDidEnterBackground(application)
    }

    public func applicationWillEnterForeground(application: UIApplication) {
        dispatcher().applicationWillEnterForeground(application)
    }

    public func applicationWillTerminate(application: UIApplication) {
        dispatcher().applicationWillTerminate(application)
    }

    // URL
    public func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return dispatcher().application(application, handleOpenURL: url)
    }
}