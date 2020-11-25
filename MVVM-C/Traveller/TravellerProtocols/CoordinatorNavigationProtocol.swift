//Copyright © 2020 Radhachandan Chilamkurthy. All rights reserved.

import UIKit

protocol TravellerNavigationProtocol: class {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    @discardableResult
    func popViewController(animated: Bool) -> UIViewController?
    @discardableResult
    func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]?
    @discardableResult
    func popToRootViewController(animated: Bool) -> [UIViewController]?
    var topViewController: UIViewController? {get}
    var visibleViewController: UIViewController? {get}
    var viewControllers: [UIViewController] {get set}
    var navigationController: UINavigationController? {get}
    @available(iOS 3.0, *)
    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool)
    func makeRootNavigation(to rootViewController: UIViewController?, isNavigationHidden: Bool) -> UINavigationController?
}

extension UINavigationController: TravellerNavigationProtocol {
    func makeRootNavigation(to rootViewController: UIViewController?, isNavigationHidden: Bool) -> UINavigationController? {
         guard let rootVc = rootViewController else { return nil }
         let navController = UINavigationController(rootViewController: rootVc)
         navController.setNavigationBarHidden(isNavigationHidden, animated: false)
         return navController
     }
}
