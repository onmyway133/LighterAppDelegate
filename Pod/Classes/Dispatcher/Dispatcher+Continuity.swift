//
//  Dispatcher+Continuity.swift
//  Pods
//
//  Created by Khoa Pham on 1/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

// Continuing User Activity
public extension Dispatcher {
    public func application(application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        var result = false

        services.forEach { service in
            result = service.application?(application, willContinueUserActivityWithType: userActivityType) ?? false
        }

        return result
    }

    public func application(application: UIApplication, continueUserActivity userActivity: NSUserActivity, restorationHandler: ([AnyObject]?) -> Void) -> Bool {
        var result = false

        services.forEach { service in
            result = service.application?(application, continueUserActivity: userActivity, restorationHandler: restorationHandler) ?? false
        }

        return result
    }

    public func application(application: UIApplication, didUpdateUserActivity userActivity: NSUserActivity) {
        services.forEach { service in
            service.application?(application, didUpdateUserActivity: userActivity)
        }
    }

    public func application(application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: NSError) {
        services.forEach { service in
            service.application?(application, didFailToContinueUserActivityWithType: userActivityType, error: error)
        }
    }
}