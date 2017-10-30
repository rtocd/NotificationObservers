//
//  Adaptable.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

/// Meant to be a wrapper for a Notification object. This is used by NotificationObserver and NotificationCenter to generate a staticly type Notification object
public protocol Adaptable {
    init(notification: Notification)
}


