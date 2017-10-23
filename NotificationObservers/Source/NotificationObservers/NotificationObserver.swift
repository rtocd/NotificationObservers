//
//  NotificationObserver.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

public class NotificationObserver<A: Adaptable>: NSObject {
    
    typealias callbackType = (A) -> ()
    
    private let name: Notification.Name
    
    private var observer: Any?
    private var callback: callbackType? = nil
    private var queue: OperationQueue?
    
    public func start(queue: OperationQueue = .main, callback: @escaping (A) -> Void) {
        if self.callback != nil {
            self.stop()
        }
        
        self.callback = callback
        self.queue = queue
        
        self.observer = NotificationCenter.default.addObserver(forName: self.name, object: nil, queue: self.queue, using: { [weak self] (notify) in
            let typed = A(notification: notify)
            self?.callback?(typed)
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
