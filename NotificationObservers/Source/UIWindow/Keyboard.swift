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
            value = .UIKeyboardWillShow
        case .willChangeFrame:
            value = .UIKeyboardWillChangeFrame
        case .willHide:
            value = .UIKeyboardWillHide
        case .didShow:
            value = .UIKeyboardDidShow
        case .didChangeFrame:
            value = .UIKeyboardDidChangeFrame
        case .didHide:
            value = .UIKeyboardDidHide
        }

        return value
    }
}
