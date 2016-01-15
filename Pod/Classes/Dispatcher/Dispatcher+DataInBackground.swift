//
//  Dispatcher+DataInBackground.swift
//  Pods
//
//  Created by Khoa Pham on 1/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

// Downloading Data in the Background
public extension Dispatcher {
    public func application(application: UIApplication, performFetchWithCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        services.forEach { service in
            service.application?(application, performFetchWithCompletionHandler: completionHandler)
        }
    }

    public func application(application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: () -> Void) {
        services.forEach { service in
            service.application?(application, handleEventsForBackgroundURLSession: identifier, completionHandler: completionHandler)
        }
    }
}