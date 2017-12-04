//
//  Keyboard.swift
//  NotificationObservers
//
//  Created by rtocd on 8/27/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

protocol KeyboardNotification {
    static var name: Notification.Name { get }
}

/// Handles all the UIKeyboard notifications that are declared in [UIWindow](https://developer.apple.com/documentation/uikit/uiwindow)
public struct Keyboard {
    public struct WillShow: KeyboardNotification {
        static let name = Notification.Name.UIKeyboardWillShow
    }
    public struct WillChangeFrame: KeyboardNotification {
        static let name = Notification.Name.UIKeyboardWillChangeFrame
    }
    public struct WillHide: KeyboardNotification {
        static let name = Notification.Name.UIKeyboardWillHide
    }
    public struct DidShow: KeyboardNotification {
        static let name = Notification.Name.UIKeyboardDidShow
    }
    public struct DidChangeFrame: KeyboardNotification {
        static let name = Notification.Name.UIKeyboardDidChangeFrame
    }
    public struct DidHide: KeyboardNotification {
        static let name = Notification.Name.UIKeyboardDidHide
    }
}
