//
//  TabBarController.swift
//  PushNotifications
//
//  Created by Yunus Emre Berdibek on 24.01.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }

    private func setUpTabBar() {
        let vc1 = PushNotification()
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let vc2 = Center1VC()
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let vc3 = Center2VC()
        vc3.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        setViewControllers([vc1, vc2, vc3], animated: true)
    }
}
