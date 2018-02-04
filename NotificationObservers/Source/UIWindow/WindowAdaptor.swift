//
//  WindowNotificationAdaptor.swift
//  NotificationObservers
//
//  Created by rtocd on 7/8/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

public extension Window {

    /// See Apple documentation for [UIWindow](https://developer.apple.com/documentation/uikit/uiwindow) for more information
    public struct Adaptor: Adaptable {
        public let notification: Notification
        
        public var window: UIWindow? {
            return self.notification.object as? UIWindow
        }
        
        public init(notification: Notification) {
            self.notification = notification
        }
    }
}

// MARK: - 
extension WindowNotification {
    public static func makeObserver() -> NotificationObserver<Window.Adaptor> {
        return NotificationObserver(name: self.name)
    }
}

// MARK: - 
extension Window.Adaptor: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "[window: \(String(describing: self.window)))]"
    }
}
