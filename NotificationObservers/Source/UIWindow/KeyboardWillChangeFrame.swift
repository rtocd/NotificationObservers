//
//  KeyboardWillChangeFrame.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import UIKit

public struct KeyboardWillChangeFrame: NotificationType, KeyboardNotificationAdaptable {
    public static let name = Notification.Name.UIKeyboardWillChangeFrame
    
    public let adaptor: KeyboardNotificationAdaptor
    
    public init?(notification: Notification) {
        self.adaptor = KeyboardNotificationAdaptor(notification: notification)
    }
}

extension KeyboardWillChangeFrame: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "KeyboardWillChangeFrame: " + self.adaptor.debugDescription
    }
}
