//
//  NotificationCenterExtensions.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

public extension NotificationCenter {
    public func addObserver<T: NotificationType>(queue: OperationQueue = .main, callback: @escaping (T) -> Void) -> Any {
        return addObserver(forName: T.name, object: nil, queue: queue, using: { note in
            guard let typed = T(notification: note) else { return }
            callback(typed)
        })
    }
}
