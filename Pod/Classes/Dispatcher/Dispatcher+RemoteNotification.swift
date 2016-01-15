//
//  Dispatcher+RemoteNotification.swift
//  Pods
//
//  Created by Khoa Pham on 1/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

// Handling Remote Notifications
public extension Dispatcher {
    public func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        services.forEach { service in
            service.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
        }
    }

    public func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        services.forEach { service in
            service.application?(application, didFailToRegisterForRemoteNotificationsWithError: error)
        }
    }

    public func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        services.forEach { service in
            service.application?(application, didReceiveRemoteNotification: userInfo)
        }
    }

    public func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        services.forEach { service in
            service.application?(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
        }
    }

    public func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        services.forEach { service in
            service.application?(application, handleActionWithIdentifier: identifier, forRemoteNotification: userInfo, completionHandler: completionHandler)
        }
    }

    @available(iOS 9.0, *)
    public func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [NSObject : AnyObject], withResponseInfo responseInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        services.forEach { service in
            service.application?(application, handleActionWithIdentifier: identifier, forRemoteNotification: userInfo, withResponseInfo: responseInfo, completionHandler: completionHandler)
        }
    }
}