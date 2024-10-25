//
//  TabBarController.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 01.05.2024.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let mainVC = MainViewController()
        let msgVC = MessagesViewController()
        msgVC.title = "Messages"
        let msgNavVC = UINavigationController(rootViewController: msgVC)
        msgNavVC.navigationBar.prefersLargeTitles = true
        msgNavVC.navigationBar.setBackgroundImage(UIImage(), for: .default)
        msgNavVC.navigationBar.shadowImage = UIImage()
        
        let profileVC = ProfileViewController()
        
        setupTabBar()
        self.setViewControllers([mainVC, msgNavVC, profileVC], animated: false)
        
        setupVC(viewController: mainVC, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"), title: "Main")
        setupVC(viewController: msgNavVC, image: UIImage(systemName: "message"), selectedImage: UIImage(systemName: "message.fill"),title: "Messages")
        setupVC(viewController: profileVC, image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle.fill"),title: "Profile")
    }
}

extension TabBarController {
    private func setupVC(viewController: UIViewController, image: UIImage?, selectedImage: UIImage?, title: String) {
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = selectedImage
        viewController.tabBarItem.title = title
        viewController.view.backgroundColor = #colorLiteral(red: 0.9215685725, green: 0.9215685725, blue: 0.9215685725, alpha: 1)
    }
    
    private func setupTabBar() {
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundColor = #colorLiteral(red: 0.9813271165, green: 0.9813271165, blue: 0.9813271165, alpha: 1)
    }
}
