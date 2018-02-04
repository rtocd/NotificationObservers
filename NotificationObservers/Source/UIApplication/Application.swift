//
//  Application.swift
//  NotificationObservers
//
//  Created by rtocd on 11/26/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

protocol ApplicationNotification {
    static var name: Notification.Name { get }
}

/// See Apple documentation for [UIApplication](https://developer.apple.com/documentation/uikit/uiapplication) for more information
public struct Application {
    public struct BackgroundRefreshStatusDidChange: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationBackgroundRefreshStatusDidChange
    }

    public struct DidBecomeActive: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationDidBecomeActive
    }
    
    public struct DidChangeStatusBarFrame: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationDidChangeStatusBarFrame
    }
    
    public struct DidChangeStatusBarOrientation: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationDidChangeStatusBarOrientation
    }
    
    public struct DidEnterBackground: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationDidEnterBackground
    }
    
    public struct DidFinishLaunching: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationDidFinishLaunching
    }
    
    public struct DidReceiveMemoryWarning: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationDidReceiveMemoryWarning
    }
    
    public struct ProtectedDataDidBecomeAvailable: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationProtectedDataDidBecomeAvailable
    }
    
    public struct ProtectedDataWillBecomeUnavailable: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationProtectedDataWillBecomeUnavailable
    }
    
    public struct UserDidTakeScreenshot: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationUserDidTakeScreenshot
    }
    
    public struct WillChangeStatusBarOrientation: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationWillChangeStatusBarOrientation
    }
    
    public struct WillChangeStatusBarFrame: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationWillChangeStatusBarFrame
    }
    
    public struct WillEnterForeground: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationWillEnterForeground
    }
    
    public struct WillResignActive: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationWillResignActive
    }
    
    public struct WillTerminate: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationWillTerminate
    }
    
    public struct ContentSizeCategoryDidChange: ApplicationNotification {
        static let name: Notification.Name = .UIContentSizeCategoryDidChange
    }
    
    public struct SignificantTimeChange: ApplicationNotification {
        static let name: Notification.Name = .UIApplicationSignificantTimeChange
    }
}
