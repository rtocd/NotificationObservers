//
//  KeyboardDidHide.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import UIKit

public struct KeyboardDidHide: NotificationType, KeyboardNotificationAdaptable {
    public static let name = Notification.Name.UIKeyboardDidHide
    
    public let adaptor: KeyboardNotificationAdaptor
    
    public init?(notification: Notification) {
        self.adaptor = KeyboardNotificationAdaptor(notification: notification)
    }
}

extension KeyboardDidHide: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "KeyboardDidHide: " + self.adaptor.debugDescription
    }
}
