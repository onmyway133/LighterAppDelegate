//
//  Dispatcher+AppExtension.swift
//  Pods
//
//  Created by Khoa Pham on 1/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

// Disallowing Specified App Extension Types
public extension Dispatcher {
    public func application(application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: String) -> Bool {
        var result = false

        services.forEach { service in
            result = service.application?(application, shouldAllowExtensionPointIdentifier: extensionPointIdentifier) ?? false
        }

        return result
    }
}