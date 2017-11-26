//
//  ViewControllerOptionalAdaptor.swift
//  NotificationObservers
//
//  Created by rtocd on 11/26/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

extension ViewController {
    
    /// See Apple documentation for [UIViewController](https://developer.apple.com/documentation/foundation/nsnotification.name/1621368-uiviewcontrollershowdetailtarget) for more information
    public struct OptionalAdaptor: Adaptable {
        public let notification: Notification
        
        public var viewController: UIViewController? {
            return self.notification.object as? UIViewController
        }
        
        public init(notification: Notification) {
            self.notification = notification
        }
    }
    
    public func makeOptionalObserver() -> NotificationObserver<OptionalAdaptor> {
        return NotificationObserver(name: self.name)
    }
    
    public static func makeOptionalObserver(_ controller: ViewController) -> NotificationObserver<OptionalAdaptor> {
        return NotificationObserver(name: controller.name)
    }
}
