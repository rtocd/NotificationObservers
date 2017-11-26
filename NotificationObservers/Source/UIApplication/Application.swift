//
//  Application.swift
//  NotificationObservers
//
//  Created by rtocd on 11/26/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

/// See Apple documentation for [UIApplication](https://developer.apple.com/documentation/uikit/uiapplication) for more information
public enum Application {
    case
        backgroundRefreshStatusDidChange,
        didBecomeActive,
        didChangeStatusBarFrame,
        didChangeStatusBarOrientation,
        didEnterBackground,
        didFinishLaunching,
        didReceiveMemoryWarning,
        protectedDataDidBecomeAvailable,
        protectedDataWillBecomeUnavailable,
        userDidTakeScreenshot,
        willChangeStatusBarOrientation,
        willChangeStatusBarFrame,
        willEnterForeground,
        willResignActive,
        willTerminate,
        contentSizeCategoryDidChange,
        significantTimeChange
    
    
    public var name: Notification.Name {
        var value: Notification.Name
        
        switch self {
        case .backgroundRefreshStatusDidChange:
            value = Notification.Name.UIApplicationBackgroundRefreshStatusDidChange
        case .didBecomeActive:
            value = Notification.Name.UIApplicationDidBecomeActive
        case .didChangeStatusBarFrame:
            value = Notification.Name.UIApplicationDidChangeStatusBarFrame
        case .didChangeStatusBarOrientation:
            value = Notification.Name.UIApplicationDidChangeStatusBarOrientation
        case .didEnterBackground:
            value = Notification.Name.UIApplicationDidEnterBackground
        case .didFinishLaunching:
            value = Notification.Name.UIApplicationDidFinishLaunching
        case .didReceiveMemoryWarning:
            value = Notification.Name.UIApplicationDidReceiveMemoryWarning
        case .protectedDataDidBecomeAvailable:
            value = Notification.Name.UIApplicationProtectedDataDidBecomeAvailable
        case .protectedDataWillBecomeUnavailable:
            value = Notification.Name.UIApplicationProtectedDataWillBecomeUnavailable
        case .userDidTakeScreenshot:
            value = Notification.Name.UIApplicationUserDidTakeScreenshot
        case .willChangeStatusBarOrientation:
            value = Notification.Name.UIApplicationWillChangeStatusBarOrientation
        case .willChangeStatusBarFrame:
            value = Notification.Name.UIApplicationWillChangeStatusBarFrame
        case .willEnterForeground:
            value = Notification.Name.UIApplicationWillEnterForeground
        case .willResignActive:
            value = Notification.Name.UIApplicationWillResignActive
        case .willTerminate:
            value = Notification.Name.UIApplicationWillTerminate
        case .contentSizeCategoryDidChange:
            value = Notification.Name.UIContentSizeCategoryDidChange
        case .significantTimeChange:
            value = Notification.Name.UIApplicationSignificantTimeChange
        }
        
        return value
    }
}
