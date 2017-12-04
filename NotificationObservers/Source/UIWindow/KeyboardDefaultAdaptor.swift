//
//  KeyboardNotificationDefaultAdaptor.swift
//  NotificationObservers
//
//  Created by rtocd on 11/12/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

public extension Keyboard {
    public struct DefaultAdaptor: Adaptable {
        
        private let adaptor: Adaptor
        
        public var animationDuration: TimeInterval {
            return self.adaptor.animationDuration ?? 0.0
        }
        
        public var isLocal: Bool {
            return self.adaptor.isLocal ?? true
        }
        
        public var endFrame: CGRect {
            return self.adaptor.endFrame ?? .zero
        }
        
        public var animationCurve: Int {
            return self.adaptor.animationCurve ?? 0
        }
        
        public var animationOptions: UIViewAnimationOptions {
            // Not sure what the sensible default is, so I picked an empty OptionSet
            return self.adaptor.animationOptions ?? []
        }
        
        public var startFrame: CGRect {
            return self.adaptor.startFrame ?? .zero
        }
        
        public init(notification: Notification) {
            self.adaptor = Adaptor(notification: notification)
        }
    }
}

extension KeyboardNotification {
    public static func makeDefaultObserver() -> NotificationObserver<Keyboard.DefaultAdaptor> {
        return NotificationObserver(name: self.name)
    }
}

// MARK: - 
extension Keyboard.DefaultAdaptor: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "Key: \(self.adaptor.notification.name) [animationDuration: \(self.animationDuration), isLocal: \(self.isLocal), endFrame: \(self.endFrame), animationCurve: \(self.animationCurve), startFrame: \(self.startFrame)]"
    }
}
