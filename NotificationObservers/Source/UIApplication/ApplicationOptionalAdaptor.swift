//
//  ApplicationOptionalAdaptor.swift
//  NotificationObservers
//
//  Created by rtocd on 11/26/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

extension Application {
    
    public struct ApplicationOptionalAdaptor: Adaptable {
        public let notification: Notification
        
        public var application: UIApplication? {
            return self.notification.object as? UIApplication
        }
        
        public init(notification: Notification) {
            self.notification = notification
        }
    }
    
    public func makeOptionalObserver() -> NotificationObserver<ApplicationOptionalAdaptor> {
        return NotificationObserver(name: self.name)
    }
    
    public static func makeOptionalObserver(_ controller: ViewController) -> NotificationObserver<ApplicationOptionalAdaptor> {
        return NotificationObserver(name: controller.name)
    }
}
