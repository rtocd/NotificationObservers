# NotificationObservers
The primary goal of this framework is to make it easier to work with [NotificationCenter](https://developer.apple.com/documentation/foundation/nsnotificationcenter). It achieve this by reducing the amount of boilerplate code that you have to write.

## Code Examples
Lets compare a common coding problem, where you want to be notified when the keyboard is displayed and get the keyboard height. This first code snippet, show how you would traditionally handle this problem.

```swift
import UIKit

class CurrentViewController: UIViewController {
    var keyboardWillShow: NSObjectProtocol?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let center = NotificationCenter.default
        let key = Notification.Name.UIKeyboardWillShow
        self.keyboardWillShow = center.addObserver(forName: key, object: nil, queue: nil, using: { (notification) in
            guard let endFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
            print("End Frame: \(endFrame)")
        })
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        if let willShow = self.keyboardWillShow {
            NotificationCenter.default.removeObserver(willShow)
            self.keyboardWillShow = nil
        }
    }
}
```

Same problem, but this time use this framework.
```swift
import UIKit
import NotificationObservers

class ViewController: UIViewController {
    var keyboardWillShowObserver = Keyboard.willShow.makeObserver()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.keyboardWillShowObserver.start { (info) in
            print("keyboardWillShowObserver: \(info.endFrame)")
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.keyboardWillShowObserver.stop()
    }
}
```

## Custom Notification
Here is an example of what to do, if you want to create your own Notification using this framework
```swift
import NotificationObservers

struct CustomNotification: Adaptable {
    let notification: Notification

    public var number: Int {
        return notification.userInfo?["num"] as? Int ?? 0
    }

    init(notification: Notification) {
        self.notification = notification
    }
}

extension CustomNotification {
    static func post(num: Int) {
        NotificationCenter.default.post(name: Notification.Name.CustomNotificationKey, object: nil, userInfo: ["num": num])
    }

    static func makeObserver() -> NotificationObserver<CustomNotification> {
        return NotificationObserver<CustomNotification>(name: Notification.Name.CustomNotificationKey)
    }
}

extension Notification.Name {
    static let CustomNotificationKey = Notification.Name("CustomNotificationKey")
}
```


### WIP
This framework is currently a work in progress. With my ultimate goal to create adaptors and enums for all of Apple's frameworks. But I am only one person and I can only do so much. If you don't see a Notification that you need, I would gladly accept a PR for it.


### Extra
Lets say you do not want to use the NotificationObserver object provided in this framework. That is perfectly ok, but I would recommend that take advantage of the Adaptor objects.

```swift
import UIKit
import NotificationObservers

class AdaptorOnlyViewController: UIViewController {
    var keyboardWillShow: NSObjectProtocol?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let center = NotificationCenter.default
        let key = Notification.Name.UIKeyboardWillShow
        self.keyboardWillShow = center.addObserver(key: key) { (adp: KeyboardNotificationAdaptor) in
            print("End Frame: \(adp.endFrame)")
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        if let willShow = self.keyboardWillShow {
            NotificationCenter.default.removeObserver(willShow)
            self.keyboardWillShow = nil
        }
    }
}
```



