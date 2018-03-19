import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().tintColor = UIColor(red: 67 / 255, green: 62 / 255, blue: 144 / 255, alpha: 1)
        UITabBar.appearance().tintColor = UIColor(red: 67 / 255, green: 62 / 255, blue: 144 / 255, alpha: 1)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            UINavigationController(rootViewController: HomeViewController())
        ]
        tabBarController.selectedIndex = 0

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }
}

