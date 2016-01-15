//
//  Dispatcher+Interface.swift
//  Pods
//
//  Created by Khoa Pham on 1/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

// Managing Interface Geometry
public extension Dispatcher {
    public func application(application: UIApplication, supportedInterfaceOrientationsForWindow window: UIWindow?) -> UIInterfaceOrientationMask {
        var result: UIInterfaceOrientationMask = .Portrait

        services.forEach { service in
            result = service.application?(application, supportedInterfaceOrientationsForWindow: window) ?? .Portrait
        }

        return result
    }

    public func application(application: UIApplication, willChangeStatusBarOrientation newStatusBarOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        services.forEach { service in
            service.application?(application, willChangeStatusBarOrientation: newStatusBarOrientation, duration: duration)
        }
    }

    public func application(application: UIApplication, didChangeStatusBarOrientation oldStatusBarOrientation: UIInterfaceOrientation) {
        services.forEach { service in
            service.application?(application, didChangeStatusBarOrientation: oldStatusBarOrientation)
        }
    }

    // This causes build problem
//    public func application(application: UIApplication, willChangeStatusBarFrame newStatusBarFrame: CGRect) {
//        services.forEach { service in
//            service.application?(application, willChangeStatusBarFrame: newStatusBarFrame)
//        }
//    }
//
//    public func application(application: UIApplication, didChangeStatusBarFrame oldStatusBarFrame: CGRect) {
//        services.forEach { service in
//            service.application?(application, didChangeStatusBarFrame: oldStatusBarFrame)
//        }
//    }
}