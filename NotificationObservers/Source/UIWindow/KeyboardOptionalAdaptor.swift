//
//  KeyboardNotificationOptionalAdaptor.swift
//  NotificationObservers
//
//  Created by rtocd on 7/8/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import UIKit

public extension Keyboard {
 
    /// See Apple documentation for [Keyboard Notification](https://developer.apple.com/documentation/uikit/uiwindow/keyboard_notification_user_info_keys) for more information
    public struct OptionalAdaptor: Adaptable {
    
        public let notification: Notification
        
        public var animationDuration: TimeInterval? {
            return self.notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double
        }
        
        public var isLocal: Bool? {
            if #available(iOS 9.0, *) {
                return self.notification.userInfo?[UIKeyboardIsLocalUserInfoKey] as? Bool
            }
            return nil
        }
        
        public var endFrame: CGRect? {
            return (self.notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        }
        
        public var animationCurve: Int? {
            return self.notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Int
        }
        
        public var startFrame: CGRect? {
            return (self.notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        }
        
        public init(notification: Notification) {
            self.notification = notification
        }
        
        /// This is not part of the notification object, but it is so commonly used with UIView animation blocks.
        public var animationOptions: UIViewAnimationOptions? {
            if let curve = self.animationCurve {
                return UIViewAnimationOptions(rawValue: UInt(curve << 16))
            }
            return nil
        }
        
        static func makeObserver(observe: Keyboard) -> NotificationObserver<Keyboard.OptionalAdaptor> {
            return NotificationObserver(name: observe.name)
        }
    }
    
    public func makeOptionalObserver() -> NotificationObserver<OptionalAdaptor> {
        return NotificationObserver(name: self.name)
    }
    
    public static func makeOptionalObserver(_ keyboard: Keyboard) -> NotificationObserver<OptionalAdaptor> {
        return NotificationObserver(name: keyboard.name)
    }
}

// MARK: -
extension Keyboard.OptionalAdaptor: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "Key: \(self.notification.name) [animationDuration: \(String(describing: self.animationDuration)), isLocal: \(String(describing:self.isLocal)), endFrame: \(String(describing:self.endFrame)), animationCurve: \(String(describing:self.animationCurve)), startFrame: \(String(describing:self.startFrame))]"
    }
}
