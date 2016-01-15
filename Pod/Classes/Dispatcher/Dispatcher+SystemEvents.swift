//
//  Dispatcher+SystemEvents.swift
//  Pods
//
//  Created by Khoa Pham on 1/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

// Responding to System Events
public extension Dispatcher {
    public func applicationProtectedDataWillBecomeUnavailable(application: UIApplication) {
        services.forEach { service in
            service.applicationProtectedDataWillBecomeUnavailable?(application)
        }
    }

    public func applicationProtectedDataDidBecomeAvailable(application: UIApplication) {
        services.forEach { service in
            service.applicationProtectedDataDidBecomeAvailable?(application)
        }
    }

    public func applicationDidReceiveMemoryWarning(application: UIApplication) {
        services.forEach { service in
            service.applicationDidReceiveMemoryWarning?(application)
        }
    }

    public func applicationSignificantTimeChange(application: UIApplication) {
        services.forEach { service in
            service.applicationSignificantTimeChange?(application)
        }
    }
}