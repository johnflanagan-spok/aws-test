import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if let viewController = window?.rootViewController as? ViewController {
            viewController.cognitoAuth?.application(app, open: url, options: options)
        }

        return true
    }
}

