//
//  Dispatcher+LocalNotification.swift
//  Pods
//
//  Created by Khoa Pham on 1/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

// Handling Local Notifications
public extension Dispatcher {
    public func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        services.forEach { service in
            service.application?(application, didRegisterUserNotificationSettings: notificationSettings)
        }
    }

    public func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        services.forEach { service in
            service.application?(application, didReceiveLocalNotification: notification)
        }
    }

    public func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        services.forEach { service in
            service.application?(application, handleActionWithIdentifier: identifier, forLocalNotification: notification, completionHandler: completionHandler)
        }
    }

    @available(iOS 9.0, *)
    public func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, withResponseInfo responseInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        services.forEach { service in
            service.application?(application, handleActionWithIdentifier: identifier, forLocalNotification: notification, withResponseInfo: responseInfo, completionHandler: completionHandler)
        }
    }
}