import UIKit

class ProfileViewController: UIViewController, BarButtonItemConfiguration {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBarButtonItem(ofType: .notification(.right), imageType: .notification)
    }
}

extension ProfileViewController: BarButtonActions {
    func showNotification(_ sender: AnyObject) {
        Traveller.route.present(story: .tab, controller: .detail, animated: true, modelTransistion: .crossDissolve, modelPresentation: .fullScreen).perform { (controller) in
            controller.title = "Settings"
        }
    }
}

extension ProfileViewController {
    
    @IBAction func logOutBackButtonPressed(_ sender: UIButton) {
        do {
            try FirebaseSignIn.signOut()
            let rootChange = UIStoryboard(name: "Login", bundle: Bundle.main)
            Traveller.route.switchRootViewController(storyBoard: rootChange, controllerDestination: .launch, animated: true, window: UIWindow.key, modelTransistion: .transitionCrossDissolve).perform()
        } catch let signOutError as NSError {
            presentAlert("Error signing out from FirebaseSignIn: %@ \(signOutError)")
        }
    }
}
