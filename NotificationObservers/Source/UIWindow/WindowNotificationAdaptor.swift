//
//  WindowNotificationAdaptor.swift
//  NotificationObservers
//
//  Created by rtocd on 7/8/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

public struct WindowNotificationAdaptor: Adaptable {
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
