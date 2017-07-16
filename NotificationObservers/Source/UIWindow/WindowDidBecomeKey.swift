//
//  WindowDidBecomeKey.swift
//  NotificationObservers
//
//  Created by rtocd on 7/8/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

public struct WindowDidBecomeKey: NotificationType, WindowNotificationAdaptable {
    public static let name = Notification.Name.UIWindowDidBecomeKey
    
    let adaptor: WindowNotificationAdaptor
    
    public init?(notification: Notification) {
        self.adaptor = WindowNotificationAdaptor(notification: notification)
    }
}

extension WindowDidBecomeKey: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "WindowDidBecomeKey: " + self.adaptor.debugDescription
    }
}
