//
//  ViewControllerAdaptor.swift
//  NotificationObservers
//
//  Created by rtocd on 11/26/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

extension ViewController {
    
    /// See Apple documentation for [UIViewController](https://developer.apple.com/documentation/foundation/nsnotification.name/1621368-uiviewcontrollershowdetailtarget) for more information
    public struct Adaptor: Adaptable {
        public let notification: Notification
        
        public var viewController: UIViewController? {
            return self.notification.object as? UIViewController
        }
        
        public init(notification: Notification) {
            self.notification = notification
        }
    }
}

// MARK: - 
extension ViewControllerNotification {
    public static func makeObserver() -> NotificationObserver<ViewController.Adaptor> {
        return NotificationObserver(name: self.name)
    }
}

// MARK: -
extension ViewController.Adaptor: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "[viewController: \(String(describing: self.viewController)))]"
    }
}
