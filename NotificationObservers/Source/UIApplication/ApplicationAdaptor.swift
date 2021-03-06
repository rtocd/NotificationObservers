//
//  ApplicationAdaptor.swift
//  NotificationObservers
//
//  Created by rtocd on 11/26/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

// You can find the userInfo keys here https://developer.apple.com/documentation/uikit/uiapplication/userinfo_dictionary_keys

extension Application {
    public struct Adaptor: Adaptable {
        public let notification: Notification
        
        public var application: UIApplication? {
            return self.notification.object as? UIApplication
        }
        
        public init(notification: Notification) {
            self.notification = notification
        }
    }
    
    public struct StatusBarFrameAdaptor: Adaptable {
        public let notification: Notification
        
        public var application: UIApplication? {
            return self.notification.object as? UIApplication
        }
        
        public var statusBarFrame: CGRect? {
            return (self.notification.userInfo?[UIApplicationStatusBarFrameUserInfoKey] as? NSValue)?.cgRectValue
        }
        
        public init(notification: Notification) {
            self.notification = notification
        }
    }
    
    public struct StatusBarOrientationAdaptor: Adaptable {
        public let notification: Notification
        
        public var application: UIApplication? {
            return self.notification.object as? UIApplication
        }
        
        public var statusBarOrientation: UIInterfaceOrientation? {
            if let value = (self.notification.userInfo?[UIApplicationStatusBarOrientationUserInfoKey] as? NSNumber)?.intValue {
                return UIInterfaceOrientation(rawValue: value)
            }
            return nil
        }
        
        public init(notification: Notification) {
            self.notification = notification
        }
    }
    
    public struct ContentSizeCategoryDidChangeAdaptor: Adaptable {
        public let notification: Notification
        
        public var application: UIApplication? {
            return self.notification.object as? UIApplication
        }
        
        public var categoryNewValue: UIContentSizeCategory? {
            if let value = self.notification.userInfo?[UIContentSizeCategoryNewValueKey] as? UIContentSizeCategory {
                return value
            }
            return nil
        }
        
        public init(notification: Notification) {
            self.notification = notification
        }
    }
    
    public struct DidFinishLaunchingAdaptor: Adaptable {
        public let notification: Notification
        
        public var application: UIApplication? {
            return self.notification.object as? UIApplication
        }
        
        public var sourceApplication: String? {
            if let value = self.notification.userInfo?[UIApplicationLaunchOptionsKey.sourceApplication] as? String {
                return value
            }
            return nil
        }
        
        public var url: URL? {
            if let value = self.notification.userInfo?[UIApplicationLaunchOptionsKey.url] as? URL {
                return value
            }
            return nil
        }
        
        public var remoteNotification: NSDictionary? {
            // Should I create an adaptor for this NSDicionary?
            if let value = self.notification.userInfo?[UIApplicationLaunchOptionsKey.remoteNotification] as? NSDictionary {
                return value
            }
            return nil
        }
        
        /// Note: This was deprecated in iOS 10. You should use UNUserNotificationCenter if possible
        public var localNotification: UILocalNotification? {
            if let value = self.notification.userInfo?[UIApplicationLaunchOptionsKey.localNotification] as? UILocalNotification {
                return value
            }
            return nil
        }
        
        public init(notification: Notification) {
            self.notification = notification
        }
    }
}

// MARK: - 
extension ApplicationNotification {
    public static func makeObserver() -> NotificationObserver<Application.Adaptor> {
        return NotificationObserver(name: self.name)
    }
}

extension Application.WillChangeStatusBarFrame {
    public static func makeObserver() -> NotificationObserver<Application.StatusBarFrameAdaptor> {
        return NotificationObserver(name: self.name)
    }
}

extension Application.DidChangeStatusBarFrame {
    public static func makeObserver() -> NotificationObserver<Application.StatusBarFrameAdaptor> {
        return NotificationObserver(name: self.name)
    }
}

extension Application.WillChangeStatusBarOrientation {
    public static func makeObserver() -> NotificationObserver<Application.StatusBarOrientationAdaptor> {
        return NotificationObserver(name: self.name)
    }
}

extension Application.DidChangeStatusBarOrientation {
    public static func makeObserver() -> NotificationObserver<Application.StatusBarOrientationAdaptor> {
        return NotificationObserver(name: self.name)
    }
}

extension Application.ContentSizeCategoryDidChange {
    public static func makeObserver() -> NotificationObserver<Application.ContentSizeCategoryDidChangeAdaptor> {
        return NotificationObserver(name: self.name)
    }
}

extension Application.DidFinishLaunching {
    public static func makeObserver() -> NotificationObserver<Application.DidFinishLaunchingAdaptor> {
        return NotificationObserver(name: self.name)
    }
}

// MARK: - 
// TODO: Finish console debugging
extension Application.Adaptor: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "[application: \(String(describing: self.application)))]"
    }
}

extension Application.StatusBarFrameAdaptor: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "[application: \(String(describing: self.application)))]"
    }
}

extension Application.StatusBarOrientationAdaptor: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "[application: \(String(describing: self.application)))]"
    }
}

extension Application.ContentSizeCategoryDidChangeAdaptor: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "[application: \(String(describing: self.application)))]"
    }
}

extension Application.DidFinishLaunchingAdaptor: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "[application: \(String(describing: self.application)))]"
    }
}
