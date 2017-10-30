//
//  NotificationObserver.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

/// This handles most of the boilerplate code needed for creating a NotificationCenter observer.
public class NotificationObserver<A: Adaptable>: NSObject {
    
    typealias callbackType = (A) -> ()
    
    private let name: Notification.Name
    
    private var observer: NSObjectProtocol?
    private var callback: callbackType? = nil
    private var queue: OperationQueue?
    
    /// Call this when you want to start observer a notification.
    /// If you call the method multiple times it will stop and replace the previously created observer.
    public func start(queue: OperationQueue = .main, object: AnyObject? = nil, callback: @escaping (A) -> Void) {
        if self.callback != nil {
            self.stop()
        }
        
        self.callback = callback
        self.queue = queue

        self.observer = NotificationCenter.default.addObserver(key: self.name, object: object, queue: queue, callback: { (adaptor) in
            callback(adaptor)
        })
    }
    
    public func stop() {
        if let observer = self.observer {
            NotificationCenter.default.removeObserver(observer)
        }
        self.callback = nil
    }
    
    public init(name: Notification.Name) {
        self.name = name
        super.init()
    }
    
    deinit {
        if let observer = self.observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}
