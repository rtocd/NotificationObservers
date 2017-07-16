//
//  KeyboardWillShow.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import UIKit

public struct KeyboardWillShow: NotificationType, KeyboardNotificationAdaptable {
    public static let name = Notification.Name.UIKeyboardWillShow
    
    let adaptor: KeyboardNotificationAdaptor
    
    public init?(notification: Notification) {
        self.adaptor = KeyboardNotificationAdaptor(notification: notification)
    }
}

extension KeyboardWillShow: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "KeyboardWillShow: " + self.adaptor.debugDescription
    }
}
