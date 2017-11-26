# NotificationObservers
The primary goal of this framework is to make it easier to work with [NotificationCenter](https://developer.apple.com/documentation/foundation/nsnotificationcenter). It achieve this by reducing the amount of boilerplate code that you have to write, for notifications.

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
            let endFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
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

Same problem, but this time using NotificationObservers.

```swift
import UIKit
import NotificationObservers

class ViewController: UIViewController {
    var keyboardWillShowObserver = Keyboard.willShow.makeDefaultObserver()

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
Here is an example of what to do, if you want to create your own Notification using this framework.

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
    
    // MARK: - Helper method
    static func post(num: Int) {
        NotificationCenter.default.post(name: .CustomNotificationKey,
                                      object: nil,
                                    userInfo: ["num": num])
    }
    
    static func makeObserver() -> NotificationObserver<CustomNotification> {
        return NotificationObserver(name: .CustomNotificationKey)
    }
}

extension Notification.Name {
    static let CustomNotificationKey = Notification.Name("CustomNotificationKey")
}

// MARK: - Example Use
class ViewController: UIViewController {
    var custom = CustomNotification.makeObserver()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.custom.start { (cust) in
            print("\nCustom: value: \(cust.number)")
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        self.custom.stop()
    }
    
    func triggerCustomNotification(value: Int) {
        CustomNotification.post(num: value)
    }
}
```

### Extra
You are not required to use the NotificationObserver object, you can just use the Adaptor objects.

```swift
import UIKit
import NotificationObservers

class AdaptorOnlyViewController: UIViewController {
    var keyboardWillShow: NSObjectProtocol?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let center = NotificationCenter.default
        let key = Notification.Name.UIKeyboardWillShow
        self.keyboardWillShow = center.addObserver(key: key) { (adp: Keyboard.DefaultAdaptor) in
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

### WIP
This framework is currently a work in progress. With my ultimate goal to create adaptors for all of Apple's Notification. But I am only one person and I can only do so much. If you don't see a Notification that you need, I would gladly accept a PR for it.



