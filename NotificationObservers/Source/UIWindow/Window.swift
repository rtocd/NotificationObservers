//
//  Window.swift
//  NotificationObservers
//
//  Created by rtocd on 10/22/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

protocol WindowNotification {
    static var name: Notification.Name { get }
}

/// Handles all the UIWindow notifications that are declared in [UIWindow](https://developer.apple.com/documentation/uikit/uiwindow)
public struct Window {
    public struct DidBecomeHidden: WindowNotification {
        static let name = Notification.Name.UIWindowDidBecomeHidden
    }
    
    public struct DidBecomeKey: WindowNotification {
        static let name = Notification.Name.UIWindowDidBecomeKey
    }
    
    public struct DidBecomeVisible: WindowNotification {
        static let name = Notification.Name.UIWindowDidBecomeVisible
    }
    
    public struct DidResignKey: WindowNotification {
        static let name = Notification.Name.UIWindowDidResignKey
    }
}
