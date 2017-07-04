//
//  NotificationObserver.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

public class NotificationObserver<T: NotificationType>: NSObject {
    
    typealias callbackType = (T) -> ()
    
    private var observer: Any?
    private var callback: callbackType? = nil
    private var queue: OperationQueue?
    
    public static func postNotification(from object: Any? = nil, userInfo: [AnyHashable: Any]? = nil) {
        NotificationCenter.default.post(name: T.name, object: object, userInfo: userInfo)
    }
    
    public func setup(queue: OperationQueue = .main, callback: @escaping (T) -> Void) {
        if self.callback != nil {
            self.tearDown()
        }
        
        self.callback = callback
        self.queue = queue
        
        self.observer = NotificationCenter.default.addObserver(forName: T.name, object: nil, queue: self.queue, using: { [weak self] (notify) in
            guard let typed = T(notification: notify) else { return }
            self?.callback?(typed)
        })
    }
    
    public func tearDown() {
        if let observer = self.observer {
            NotificationCenter.default.removeObserver(observer)
        }
        self.callback = nil
    }
    
    deinit {
        if let observer = self.observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}
