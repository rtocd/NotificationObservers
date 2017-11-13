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
    public struct OptionalAdaptor: Adaptable {
        public let notification: Notification
        
        public var window: UIWindow? {
            return self.notification.object as? UIWindow
        }
        
        public init(notification: Notification) {
            self.notification = notification
        }
    }
    
    public func makeOptionalObserver() -> NotificationObserver<OptionalAdaptor> {
        return NotificationObserver<OptionalAdaptor>(name: self.name)
    }
    
    public static func makeOptionalObserver(_ window: Window) -> NotificationObserver<OptionalAdaptor> {
        return NotificationObserver<OptionalAdaptor>(name: window.name)
    }
}

// MARK: - 
extension Window.OptionalAdaptor: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "[window: \(String(describing: self.window)))]"
    }
}
