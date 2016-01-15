//
//  Dispatcher.swift
//  Pods
//
//  Created by Khoa Pham on 1/15/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

// Reference: https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIApplicationDelegate_Protocol/index.html?hl=ar#//apple_ref/occ/intfm/

public class Dispatcher : NSObject, UIApplicationDelegate {
    public let services: [UIApplicationDelegate]

    public init(services: [UIApplicationDelegate]) {
        self.services = services
    }
}