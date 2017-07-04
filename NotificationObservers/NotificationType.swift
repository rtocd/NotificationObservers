//
//  NotificationType.swift
//  Notification
//
//  Created by rtocd on 7/4/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

public protocol NotificationType {
    static var name: Notification.Name { get }
    init?(notification: Notification)
}
