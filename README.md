# LighterAppDelegate
Lighter AppDelegate by dispatching events

[![CI Status](http://img.shields.io/travis/Khoa Pham/LighterAppDelegate.svg?style=flat)](https://travis-ci.org/Khoa Pham/LighterAppDelegate)
[![Version](https://img.shields.io/cocoapods/v/LighterAppDelegate.svg?style=flat)](http://cocoapods.org/pods/LighterAppDelegate)
[![License](https://img.shields.io/cocoapods/l/LighterAppDelegate.svg?style=flat)](http://cocoapods.org/pods/LighterAppDelegate)
[![Platform](https://img.shields.io/cocoapods/p/LighterAppDelegate.svg?style=flat)](http://cocoapods.org/pods/LighterAppDelegate)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Features

### Dispatching events

- See [Lighter AppDelegate](http://www.fantageek.com/blog/2015/10/31/lighter-appdelegate/)
- Dispatching `UIApplicationDelegate` events into specific `Service` class. We can have RootService, DebugService, AnalyticsService, ...

```swift
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
```

### Composition

- Initialize `Dispatcher` with your list of services
- Dispatch interested `UIApplicationDelegate` events to `Dispatcher`

```swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let dispatcher = Dispatcher(services: [RootService()])

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        return dispatcher.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
```

### Inheritance

- Conform to protocol `LighterAppDelegate`
- Implement `dispatcher()`
- `LighterAppDelegate` has protocol extension with default implementations for `App State Changes` and `URL` events, which is suitable for common usage. 

```swift
@UIApplicationMain
class AppDelegate: UIResponder, LighterAppDelegate {

    var window: UIWindow?
    let simpleDispatcher = Dispatcher(services: [RootService()])

    func dispatcher() -> Dispatcher {
        return simpleDispatcher
    }

    func applicationDidReceiveMemoryWarning(application: UIApplication) {
        dispatcher().applicationDidReceiveMemoryWarning(application)
    }
}
```

## Installation

LighterAppDelegate is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LighterAppDelegate"
```

## Credit
Credit goes to http://sizeof.io/service-oriented-appdelegate/

## Author

Khoa Pham, onmyway133@gmail.com

## License

LighterAppDelegate is available under the MIT license. See the LICENSE file for more info.
