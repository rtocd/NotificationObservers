//
//  ViewController.swift
//  NotificationObservers
//
//  Created by rtocd on 11/26/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

/// See Apple documentation for [UIViewController](https://developer.apple.com/documentation/uikit/uiviewcontroller) for more information
public enum ViewController {
    case showDetailTargetDidChange
    
    public var name: Notification.Name {
        var value: Notification.Name
        
        switch self {
        case .showDetailTargetDidChange:
            value = .UIViewControllerShowDetailTargetDidChange
        }
        
        return value
    }
}
