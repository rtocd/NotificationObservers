//
//  NotificationCenterExtensions.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

/// This extension make it so we can just use 
public extension NotificationCenter {
    public func addObserver<A: Adaptable>(key: Notification.Name, object: AnyObject? = nil, queue: OperationQueue = .main, callback: @escaping (A) -> Void) -> NSObjectProtocol {
        return addObserver(forName: key, object: object, queue: queue, using: { notification in
            callback(A(notification: notification))
        })
    }
}
