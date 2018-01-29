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
}

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
