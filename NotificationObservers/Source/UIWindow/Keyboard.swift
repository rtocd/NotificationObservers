//
//  Keyboard.swift
//  NotificationObservers
//
//  Created by rtocd on 8/27/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

/// Handles all the UIKeyboard notifications that are declared in [UIWindow](https://developer.apple.com/documentation/uikit/uiwindow)
public enum Keyboard {
    case willShow, willChangeFrame, willHide, didShow, didChangeFrame, didHide

    public var name: Notification.Name {
        var value: Notification.Name

        switch self {
        case .willShow:
            value = Notification.Name.UIKeyboardWillShow
        case .willChangeFrame:
            value = Notification.Name.UIKeyboardWillChangeFrame
        case .willHide:
            value = Notification.Name.UIKeyboardWillHide
        case .didShow:
            value = Notification.Name.UIKeyboardDidShow
        case .didChangeFrame:
            value = Notification.Name.UIKeyboardDidChangeFrame
        case .didHide:
            value = Notification.Name.UIKeyboardDidHide
        }

        return value
    }
    
    public func makeObserver() -> NotificationObserver<KeyboardNotificationAdaptor> {
        return NotificationObserver<KeyboardNotificationAdaptor>(name: self.name)
    }
}
