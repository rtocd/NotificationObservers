//
//  StructKeyboard.swift
//  NotificationObservers
//
//  Created by rtocd on 12/3/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

struct SKeyboard {
    struct WillShow {
        static let name = Notification.Name.UIKeyboardWillShow
    }
    struct DidShow {
        static let name = Notification.Name.UIKeyboardDidShow
    }
    // ... etc
}

extension SKeyboard {
    public struct Adaptor: Adaptable {
        public let notification: Notification
        
        public var endFrame: CGRect? {
            return (self.notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        }
        
        public var startFrame: CGRect? {
            return (self.notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        }
        
        public init(notification: Notification) {
            self.notification = notification
        }
    }
}

extension SKeyboard.WillShow {
    static public func makeObserver() -> NotificationObserver<SKeyboard.Adaptor> {
        return NotificationObserver(name: self.name)
    }
}

extension SKeyboard.DidShow {
    static public func makeObserver() -> NotificationObserver<SKeyboard.Adaptor> {
        return NotificationObserver(name: self.name)
    }
}

/*
 Doing this allows me to do:
    SKeyboard.willShow.makeObserver()
    SKeyboard.didShow.makeObserver()
 */


