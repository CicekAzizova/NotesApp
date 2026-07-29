import UIKit

final class RootViewController: UIViewController {
    private var currentController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        showLogin()
    }

    private func showLogin() {
        let controller = LoginViewController()
        controller.onLogin = { [weak self] in
            self?.showMainApplication()
        }
        replaceCurrentController(with: controller)
    }

    private func showMainApplication() {
        let notes = UINavigationController(rootViewController: NotesViewController())
        notes.tabBarItem = UITabBarItem(title: "Notes", image: UIImage(systemName: "note.text"), tag: 0)

        let jsonLab = UINavigationController(rootViewController: JSONLabViewController())
        jsonLab.tabBarItem = UITabBarItem(title: "JSON", image: UIImage(systemName: "curlybraces"), tag: 1)

        let settingsController = SettingsViewController()
        settingsController.onLogout = { [weak self] in
            self?.showLogin()
        }
        let settings = UINavigationController(rootViewController: settingsController)
        settings.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), tag: 2)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [notes, jsonLab, settings]
        replaceCurrentController(with: tabBarController)
    }

    private func replaceCurrentController(with controller: UIViewController) {
        currentController?.willMove(toParent: nil)
        currentController?.view.removeFromSuperview()
        currentController?.removeFromParent()

        addChild(controller)
        controller.view.frame = view.bounds
        controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(controller.view)
        controller.didMove(toParent: self)
        currentController = controller
    }
}
