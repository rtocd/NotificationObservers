//
//  KeyboardDidShow.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import UIKit

public struct KeyboardDidShow: NotificationType, KeyboardNotificationAdaptable {
    public static let name = Notification.Name.UIKeyboardDidShow
    
    let adaptor: KeyboardNotificationAdaptor
    
    public init?(notification: Notification) {
        self.adaptor = KeyboardNotificationAdaptor(notification: notification)
    }
}

extension KeyboardDidShow: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "KeyboardDidShow: " + self.adaptor.debugDescription
    }
}
