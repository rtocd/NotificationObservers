//
//  Window.swift
//  NotificationObservers
//
//  Created by rtocd on 10/22/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

/// Handles all the UIWindow notifications that are declared in [UIWindow](https://developer.apple.com/documentation/uikit/uiwindow)
public enum Window {
    case didBecomeHidden, didBecomeKey, didBecomeVisible, didResignKey
    
    public var name: Notification.Name {
        var value: Notification.Name
        
        switch self {
        case .didBecomeHidden:
            value = .UIWindowDidBecomeHidden
        case .didBecomeKey:
            value = .UIWindowDidBecomeKey
        case .didBecomeVisible:
            value = .UIWindowDidBecomeVisible
        case .didResignKey:
            value = .UIWindowDidResignKey
        }
        
        return value
    }
}
