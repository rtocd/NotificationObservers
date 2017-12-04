//
//  ViewController.swift
//  NotificationObservers
//
//  Created by rtocd on 11/26/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

protocol ViewControllerNotification {
    static var name: Notification.Name { get }
}

/// See Apple documentation for [UIViewController](https://developer.apple.com/documentation/uikit/uiviewcontroller) for more information
public struct ViewController {
    public struct ShowDetailTargetDidChange: ViewControllerNotification {
         static let name: Notification.Name = .UIViewControllerShowDetailTargetDidChange
    }
}
