//
//  KeyboardNotificationAdaptable.swift
//  NotificationObservers
//
//  Created by rtocd on 7/8/17.
//  Copyright © 2017 RTOCD. All rights reserved.
//

import Foundation

protocol KeyboardNotificationAdaptable {
    var adaptor: KeyboardNotificationAdaptor { get }
}

extension KeyboardNotificationAdaptable {
    
    var animationDuration: TimeInterval {
        return self.adaptor.animationDuration
    }
    
    var isLocal: Bool {
        return self.adaptor.isLocal
    }
    
    var endFrame: CGRect {
        return self.adaptor.endFrame
    }
    
    var animationCurve: Int {
        return self.adaptor.animationCurve
    }
    
    var startFrame: CGRect {
        return self.adaptor.startFrame
    }
}
