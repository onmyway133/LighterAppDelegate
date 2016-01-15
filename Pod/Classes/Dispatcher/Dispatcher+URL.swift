//
//  Dispatcher+URL.swift
//  Pods
//
//  Created by Khoa Pham on 1/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

// Opening a URL-Specified Resource
public extension Dispatcher {
    public func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        var result = false

        services.forEach { service in
            result = service.application?(application, handleOpenURL: url) ?? false
        }

        return result
    }
}