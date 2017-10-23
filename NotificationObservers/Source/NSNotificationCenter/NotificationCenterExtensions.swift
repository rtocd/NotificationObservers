//
//  NotificationCenterExtensions.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

public extension NotificationCenter {
    public func addObserver<A: Adaptable>(key: Notification.Name, object: AnyObject? = nil, queue: OperationQueue = .main, callback: @escaping (A) -> Void) -> Any {
        return addObserver(forName: key, object: object, queue: queue, using: { note in
            callback(A(notification: note))
        })
    }
}
