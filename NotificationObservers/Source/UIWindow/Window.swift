//
//  Window.swift
//  NotificationObservers
//
//  Created by rtocd on 10/22/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

public enum Window {
    case didBecomeHidden, didBecomeKey, didBecomeVisible, didResignKey
    
    public var name: Notification.Name {
        var value: Notification.Name
        
        switch self {
        case .didBecomeHidden:
            value = Notification.Name.UIWindowDidBecomeHidden
        case .didBecomeKey:
            value = Notification.Name.UIWindowDidBecomeKey
        case .didBecomeVisible:
            value = Notification.Name.UIWindowDidBecomeVisible
        case .didResignKey:
            value = Notification.Name.UIWindowDidResignKey
        }
        
        return value
    }
    
    public func makeObserver() -> NotificationObserver<WindowNotificationAdaptor> {
        return NotificationObserver<WindowNotificationAdaptor>(name: self.name)
    }
}
