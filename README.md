# NotificationObservers
The goal of this framework is to make it easier to write and handle [NotificationCenter](https://developer.apple.com/documentation/foundation/nsnotificationcenter) code. We do this by converting notifications into explicit types ([NotificationType](https://github.com/rtocd/NotificationObservers/blob/master/NotificationObservers/NotificationType.swift)), and hide `NotificationCenter` behind a [NotificationObserver](https://github.com/rtocd/NotificationObservers/blob/master/NotificationObservers/NotificationObserver.swift) object.

## A Simple Example
```swift
import UIKit
import NotificationObservers

class ViewController: UIViewController {
    
    var keyboardWillShowObserver = KeyboardWillShow.makeObserver()
    var keyboardDidShowObserver = KeyboardDidShow.makeObserver()
    
    var keyboardWillHideObserver = KeyboardWillHide.makeObserver()
    var KeyboardDidHideObserver = KeyboardDidHide.makeObserver()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.keyboardWillShowObserver.start { (info) in
            print("keyboardWillShowObserver: \(info)")
        }
        self.keyboardDidShowObserver.start { (info) in
            print("keyboardDidShowObserver: \(info)")
        }
        
        self.keyboardWillHideObserver.start { (info) in
            print("keyboardWillHideObserver: \(info)")
        }
        self.KeyboardDidHideObserver.start { (info) in
            print("KeyboardDidHideObserver: \(info)")
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.keyboardWillShowObserver.stop()
        self.keyboardDidShowObserver.stop()
        
        self.keyboardWillHideObserver.stop()
        self.KeyboardDidHideObserver.stop()
    }
}
```



