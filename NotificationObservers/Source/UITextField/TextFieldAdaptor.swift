//
//  TextFieldAdaptor.swift
//  NotificationObservers
//
//  Created by rtocd on 3/4/18.
//  Copyright © 2018 RTOCD. All rights reserved.
//

import Foundation

extension TextField {
    public struct Adaptor: Adaptable {
        public let notification: Notification
        
        public var textField: UITextField? {
            return self.notification.object as? UITextField
        }
        
        public init(notification: Notification) {
            self.notification = notification
        }
    }
}

// MARK: -
extension TextFieldNotification {
    public static func makeObserver() -> NotificationObserver<TextField.Adaptor> {
        return NotificationObserver(name: self.name)
    }
}
