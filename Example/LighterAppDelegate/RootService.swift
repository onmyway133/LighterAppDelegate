//
//  RootService.swift
//  AppDelegate
//
//  Created by Khoa Pham on 1/16/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import UIKit

class RootService : NSObject, UIApplicationDelegate {
    func application(application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {

            appDelegate().window = UIWindow(frame: UIScreen.mainScreen().bounds)
            showHome()
            appDelegate().window?.makeKeyAndVisible()

            return true
    }
}

extension RootService {
    func showHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        appDelegate().window?.rootViewController = storyboard.instantiateInitialViewController()
    }
}

extension RootService {
    func appDelegate() -> AppDelegate {
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }
}