//
//  KeyboardDidShow.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import UIKit

public struct KeyboardDidShow: NotificationType {
    public static let name = Notification.Name.UIKeyboardDidShow
    
    public let animationDuration: TimeInterval
    public let isLocal: Bool
    public let endFrame: CGRect
    public let animationCurve: Int // Should I make this into a [UIViewAnimationCurve]?
    public let startFrame: CGRect
    
    public static func makeObserver() -> NotificationObserver<KeyboardDidShow> {
        return NotificationObserver<KeyboardDidShow>()
    }
    
    public init?(notification: Notification) {
        self.animationDuration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double ?? 0.0
        self.isLocal = (notification.userInfo?[UIKeyboardIsLocalUserInfoKey] as? Bool) ?? true
        self.endFrame = ((notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) ?? .zero
        self.animationCurve = (notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Int) ?? 0
        self.startFrame = ((notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) ?? .zero
    }
}

// MARK: - 
extension KeyboardDidShow: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "KeyboardDidShow: [animationDuration: \(String(describing: self.animationDuration)), isLocal: \(self.isLocal), endFrame: \(self.endFrame), animationCurve: \(self.animationCurve), startFrame: \(self.startFrame)]"
    }
}
