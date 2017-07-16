//
//  WindowDidResignKey.swift
//  NotificationObservers
//
//  Created by rtocd on 7/8/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

public struct WindowDidResignKey: NotificationType, WindowNotificationAdaptable {
    public static let name = Notification.Name.UIWindowDidResignKey
    
    public let adaptor: WindowNotificationAdaptor
    
    public init?(notification: Notification) {
        self.adaptor = WindowNotificationAdaptor(notification: notification)
    }
}

extension WindowDidResignKey: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "WindowDidResignKey: " + self.adaptor.debugDescription
    }
}
