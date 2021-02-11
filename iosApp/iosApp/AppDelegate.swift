import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let navigationController = UINavigationController()

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()

            navigationController.setViewControllers([HomeViewController()], animated: false)
        }
        return true
    }
}
