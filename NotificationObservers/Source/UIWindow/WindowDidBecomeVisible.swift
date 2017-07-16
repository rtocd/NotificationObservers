//
//  WindowDidBecomeVisible.swift
//  NotificationObservers
//
//  Created by rtocd on 7/8/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

public struct WindowDidBecomeVisible: NotificationType, WindowNotificationAdaptable {
    public static let name = Notification.Name.UIWindowDidBecomeVisible
    
    public let adaptor: WindowNotificationAdaptor
    
    public init?(notification: Notification) {
        self.adaptor = WindowNotificationAdaptor(notification: notification)
    }
}

extension WindowDidBecomeVisible: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "WindowDidBecomeVisible: " + self.adaptor.debugDescription
    }
}
