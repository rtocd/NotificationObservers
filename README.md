# NotificationObservers
The goal of this framework is to make it easier to write and deal with [NotificationCenter](https://developer.apple.com/documentation/foundation/nsnotificationcenter) code. 

## A Simple Example
```swift
import UIKit
import NotificationObservers

class ViewController: UIViewController {
    
    var keyboardWillShowObserver = Keyboard.willShow.makeObserver()
    var keyboardWillHideObserver = Keyboard.willHide.makeObserver()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.keyboardWillShowObserver.start { (info) in
            print("keyboardWillShowObserver: \(info.endFrame)")
        }
        
        self.keyboardWillHideObserver.start { (info) in
            print("keyboardWillHideObserver: \(info.endFrame)")
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.keyboardWillShowObserver.stop()
        self.keyboardWillHideObserver.stop()
    }
}
```



