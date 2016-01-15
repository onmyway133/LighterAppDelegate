//
//  Dispatcher+QuickAction.swift
//  Pods
//
//  Created by Khoa Pham on 1/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

// Handling Quick Actions
public extension Dispatcher {
    @available(iOS 9.0, *)
    public func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        services.forEach { service in
            service.application?(application, performActionForShortcutItem: shortcutItem, completionHandler: completionHandler)
        }
    }
}