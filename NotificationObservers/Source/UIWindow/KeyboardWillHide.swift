//
//  KeyboardWillHide.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import UIKit

public struct KeyboardWillHide: NotificationType, KeyboardNotificationAdaptable {
    public static let name = Notification.Name.UIKeyboardWillHide
    
    public let adaptor: KeyboardNotificationAdaptor
    
    public init?(notification: Notification) {
        self.adaptor = KeyboardNotificationAdaptor(notification: notification)
    }
}

extension KeyboardWillHide: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "KeyboardWillHide: " + self.adaptor.debugDescription
    }
}
