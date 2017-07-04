//
//  KeyboardDidChangeFrame.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import UIKit

public struct KeyboardDidChangeFrame: NotificationType {
    public static let name = Notification.Name.UIKeyboardDidChangeFrame
    
    public let animationDuration: TimeInterval
    public let isLocal: Bool
    public let endFrame: CGRect
    public let animationCurve: Int // Should I make this into a [UIViewAnimationCurve]?
    public let startFrame: CGRect
    
    public static func makeObserver() -> NotificationObserver<KeyboardDidChangeFrame> {
        return NotificationObserver<KeyboardDidChangeFrame>()
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
extension KeyboardDidChangeFrame: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "KeyboardDidChangeFrame: [animationDuration: \(String(describing: self.animationDuration)), isLocal: \(self.isLocal), endFrame: \(self.endFrame), animationCurve: \(self.animationCurve), startFrame: \(self.startFrame)]"
    }
}
