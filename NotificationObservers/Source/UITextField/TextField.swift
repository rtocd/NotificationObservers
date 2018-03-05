//
//  TextField.swift
//  NotificationObservers
//
//  Created by rtocd on 3/4/18.
//  Copyright © 2018 RTOCD. All rights reserved.
//

import Foundation

protocol TextFieldNotification {
    static var name: Notification.Name { get }
}

/**
    [UITextField](https://developer.apple.com/documentation/uikit/uitextfield#1652976)
 */
public struct TextField {
    
    /**
     Notifies observers that the text in a text field changed.
     
     - SeeAlso:
     [UITextFieldTextDidChange Documentation](https://developer.apple.com/documentation/foundation/nsnotification.name/1619640-uitextfieldtextdidchange)
     */
    public struct TextDidChange: TextFieldNotification {
        static let name: Notification.Name = .UITextFieldTextDidChange
    }

    /// [UITextFieldTextDidBeginEditing Documentation](https://developer.apple.com/documentation/foundation/nsnotification.name/1619616-uitextfieldtextdidbeginediting)
    public struct TextDidBeginEditing: TextFieldNotification {
        static let name: Notification.Name = .UITextFieldTextDidBeginEditing
    }
    
    /// [UITextFieldTextDidEndEditing Documentation](https://developer.apple.com/documentation/foundation/nsnotification.name/1619633-uitextfieldtextdidendediting)
    public struct TextDidEndEditing: TextFieldNotification {
        static let name: Notification.Name = .UITextFieldTextDidEndEditing
    }
}
