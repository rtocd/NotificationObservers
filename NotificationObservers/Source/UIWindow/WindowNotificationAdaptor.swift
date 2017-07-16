//
//  WindowNotificationAdaptor.swift
//  NotificationObservers
//
//  Created by rtocd on 7/8/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

public struct WindowNotificationAdaptor {
    public let window: UIWindow
    
    public init(notification: Notification) {
        self.window = notification.object as! UIWindow // Should I really force this? Not really liking the idea of propagating optional.
    }
}

extension WindowNotificationAdaptor: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "[window: \(String(describing: self.window)))]"
    }
}

// MARK: - 
protocol WindowNotificationAdaptable {
    var adaptor: WindowNotificationAdaptor { get }
}

extension WindowNotificationAdaptable {
    var window: UIWindow {
        return self.adaptor.window
    }
}
