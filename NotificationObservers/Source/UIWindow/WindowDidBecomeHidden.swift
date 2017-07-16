//
//  WindowDidBecomeHidden.swift
//  NotificationObservers
//
//  Created by rtocd on 7/8/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

public struct WindowDidBecomeHidden: NotificationType, WindowNotificationAdaptable {
    public static let name = Notification.Name.UIWindowDidBecomeHidden
    
    let adaptor: WindowNotificationAdaptor
    
    public init?(notification: Notification) {
        self.adaptor = WindowNotificationAdaptor(notification: notification)
    }
}

extension WindowDidBecomeHidden: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "WindowDidBecomeHidden: " + self.adaptor.debugDescription
    }
}
