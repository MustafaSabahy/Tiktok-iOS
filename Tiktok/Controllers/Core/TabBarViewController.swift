//
//  TabBarViewController.swift
//  Tiktok
//
//  Created by mustafa sabahy on 02/07/2022.
//

import UIKit

class TabBarViewController: UITabBarController {
 
    private var signInPresented = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpControllers()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !signInPresented {
            presentSignInIfNeeded()
        }
    }

    private func presentSignInIfNeeded() {
        if !AuthManager.shared.isSignedIn {
            signInPresented = true
            let vc = SignInViewController()
            vc.completion = { [weak self] in
                self?.signInPresented = false
            }
            let navVC = UINavigationController(rootViewController: vc)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: false, completion: nil)
        }
    }

    private func setUpControllers(){
        
        let home = HomeViewController()
        let explore = ExploreViewController()
        let camera = CameraViewController()
        let notifications = NotificationsViewController()
        let profile = ProfileViewController(user: User(username: "sabahy", profilePictureURL: nil, identifier: "123"))
        
//        home.title = "Home"
//        explore.title = "Explore"
        notifications.title = "Notifications"
        profile.title = "Profile"
        
        
        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: explore)
        let nav3 = UINavigationController(rootViewController: notifications)
        let nav4 = UINavigationController(rootViewController: profile)

        
        nav1.navigationBar.backgroundColor = .clear
        nav1.navigationBar.setBackgroundImage(UIImage(), for: .default)
        nav1.navigationBar.shadowImage = UIImage()
        
        
        
        nav1.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "safari"), tag: 2)
        camera.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "camera"), tag: 3)
        nav3.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "bell"), tag: 4)
        nav4.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person.circle"), tag: 5)

        setViewControllers([nav1, nav2 , camera ,nav3 , nav4], animated: false)
    }
  

}
