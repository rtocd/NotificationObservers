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
        public let adaptor: OptionalAdaptor
        
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
            self.adaptor = OptionalAdaptor(notification: notification)
        }
        
        static func makeObserver(observe: Keyboard) -> NotificationObserver<Keyboard.DefaultAdaptor> {
            return NotificationObserver(name: observe.name)
        }
    }
    
    public func makeDefaultObserver() -> NotificationObserver<DefaultAdaptor> {
        return NotificationObserver(name: self.name)
    }
    
    public static func makeDefaultObserver(_ keyboard: Keyboard) -> NotificationObserver<DefaultAdaptor> {
        return NotificationObserver(name: keyboard.name)
    }
}

// MARK: - 
extension Keyboard.DefaultAdaptor: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "Key: \(self.adaptor.notification.name) [animationDuration: \(self.animationDuration), isLocal: \(self.isLocal), endFrame: \(self.endFrame), animationCurve: \(self.animationCurve), startFrame: \(self.startFrame)]"
    }
}
