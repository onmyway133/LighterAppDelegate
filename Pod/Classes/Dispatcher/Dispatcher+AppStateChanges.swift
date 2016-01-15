//
//  Dispatcher+AppStateChanges.swift
//  Pods
//
//  Created by Khoa Pham on 1/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

// MARK: Responding to App State Changes
public extension Dispatcher {
    public func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        services.forEach { service in
            service.application?(application, willFinishLaunchingWithOptions: launchOptions)
        }

        return true
    }

    public func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        services.forEach { service in
            service.application?(application, didFinishLaunchingWithOptions: launchOptions)
        }

        return true
    }

    public func applicationDidFinishLaunching(application: UIApplication) {
        services.forEach { service in
            service.applicationDidFinishLaunching?(application)
        }
    }

    public func applicationDidBecomeActive(application: UIApplication) {
        services.forEach { service in
            service.applicationDidBecomeActive?(application)
        }
    }

    public func applicationWillResignActive(application: UIApplication) {
        services.forEach { service in
            service.applicationWillResignActive?(application)
        }
    }

    public func applicationDidEnterBackground(application: UIApplication) {
        services.forEach { service in
            service.applicationDidEnterBackground?(application)
        }
    }

    public func applicationWillEnterForeground(application: UIApplication) {
        services.forEach { service in
            service.applicationWillEnterForeground?(application)
        }
    }

    public func applicationWillTerminate(application: UIApplication) {
        services.forEach { service in
            service.applicationWillTerminate?(application)
        }
    }
}