//
//  Dispatcher+HealthKit.swift
//  Pods
//
//  Created by Khoa Pham on 1/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

// Interacting With HealthKit
public extension Dispatcher {
    @available(iOS 9.0, *)
    public func applicationShouldRequestHealthAuthorization(application: UIApplication) {
        services.forEach { service in
            service.applicationShouldRequestHealthAuthorization?(application)
        }
    }
}