//
//  KeyboardNotificationAdaptor.swift
//  NotificationObservers
//
//  Created by rtocd on 7/8/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import UIKit

public struct KeyboardNotificationAdaptor {
    public let animationDuration: TimeInterval
    public let isLocal: Bool
    public let endFrame: CGRect
    public let animationCurve: Int
    public let startFrame: CGRect
    
    public init(notification: Notification) {
        self.animationDuration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double ?? 0.0
        self.endFrame = ((notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) ?? .zero
        self.animationCurve = (notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Int) ?? 0
        self.startFrame = ((notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) ?? .zero
        
        if #available(iOS 9.0, *) {
            self.isLocal = (notification.userInfo?[UIKeyboardIsLocalUserInfoKey] as? Bool) ?? true
        } else {
            self.isLocal = true
        }
    }
}

extension KeyboardNotificationAdaptor: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "[animationDuration: \(String(describing: self.animationDuration)), isLocal: \(self.isLocal), endFrame: \(self.endFrame), animationCurve: \(self.animationCurve), startFrame: \(self.startFrame)]"
    }
}