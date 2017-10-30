//
//  WindowNotificationAdaptor.swift
//  NotificationObservers
//
//  Created by rtocd on 7/8/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

/// See Apple documentation for [UIWindow](https://developer.apple.com/documentation/uikit/uiwindow) for more information
public struct WindowNotificationAdaptor: Adaptable {
    public let notification: Notification
    
    public var window: UIWindow {
        // Should I really force this? Not really liking the idea of propagating optional.
        return self.notification.object as! UIWindow
    }
    
    public init(notification: Notification) {
        self.notification = notification
    }
}

extension WindowNotificationAdaptor: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "[window: \(String(describing: self.window)))]"
    }
}
