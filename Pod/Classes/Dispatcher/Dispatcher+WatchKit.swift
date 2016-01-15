//
//  Dispatcher+WatchKit.swift
//  Pods
//
//  Created by Khoa Pham on 1/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

// Interacting With WatchKit
public extension Dispatcher {
    public func application(application: UIApplication, handleWatchKitExtensionRequest userInfo: [NSObject : AnyObject]?, reply: ([NSObject : AnyObject]?) -> Void) {
        services.forEach { service in
            service.application?(application, handleWatchKitExtensionRequest: userInfo, reply: reply)
        }
    }
}