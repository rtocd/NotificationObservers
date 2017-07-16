//
//  KeyboardDidChangeFrame.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import UIKit

public struct KeyboardDidChangeFrame: NotificationType, KeyboardNotificationAdaptable {
    public static let name = Notification.Name.UIKeyboardDidChangeFrame
    
    public let adaptor: KeyboardNotificationAdaptor
    
    public init?(notification: Notification) {
        self.adaptor = KeyboardNotificationAdaptor(notification: notification)
    }
}

extension KeyboardDidChangeFrame: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "KeyboardDidChangeFrame: " + self.adaptor.debugDescription
    }
}
