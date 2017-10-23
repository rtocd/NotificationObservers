//
//  KeyboardNotificationAdaptor.swift
//  NotificationObservers
//
//  Created by rtocd on 7/8/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import UIKit

public struct KeyboardNotificationAdaptor: Adaptable {
    
    public let notification: Notification
    
    var animationDuration: TimeInterval {
        return self.notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double ?? 0.0
    }
    
    var isLocal: Bool {
        if #available(iOS 9.0, *) {
            return (self.notification.userInfo?[UIKeyboardIsLocalUserInfoKey] as? Bool) ?? true
        }
        return true
    }
    
    var endFrame: CGRect {
        return ((self.notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) ?? .zero
    }
    
    var animationCurve: Int {
        return (self.notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Int) ?? 0
    }
    
    var startFrame: CGRect {
        return ((self.notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) ?? .zero
    }
    
    public init(notification: Notification) {
        self.notification = notification
    }
}

extension KeyboardNotificationAdaptor: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "Key: \(self.notification.name) [animationDuration: \(String(describing: self.animationDuration)), isLocal: \(self.isLocal), endFrame: \(self.endFrame), animationCurve: \(self.animationCurve), startFrame: \(self.startFrame)]"
    }
}

