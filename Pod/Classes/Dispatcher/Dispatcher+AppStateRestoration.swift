//
//  Dispatcher+AppStateRestoration.swift
//  Pods
//
//  Created by Khoa Pham on 1/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

// Managing App State Restoration
public extension Dispatcher {
    public func application(application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {

        var result = false

        services.forEach { service in
            result = service.application?(application, shouldSaveApplicationState: coder) ?? false
        }

        return result
    }

    public func application(application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {

        var result = false

        services.forEach { service in
            result = service.application?(application, shouldRestoreApplicationState: coder) ?? false
        }

        return result
    }

    public func application(application: UIApplication, viewControllerWithRestorationIdentifierPath identifierComponents: [AnyObject], coder: NSCoder) -> UIViewController? {
        var result: UIViewController? = nil

        services.forEach { service in
            result = service.application?(application, viewControllerWithRestorationIdentifierPath: identifierComponents, coder: coder) ?? nil
        }

        return result
    }

    public func application(application: UIApplication, willEncodeRestorableStateWithCoder coder: NSCoder) {
        services.forEach { service in
            service.application?(application, willEncodeRestorableStateWithCoder: coder)
        }
    }

    public func application(application: UIApplication, didDecodeRestorableStateWithCoder coder: NSCoder) {
        services.forEach { service in
            service.application?(application, didDecodeRestorableStateWithCoder: coder)
        }
    }
}