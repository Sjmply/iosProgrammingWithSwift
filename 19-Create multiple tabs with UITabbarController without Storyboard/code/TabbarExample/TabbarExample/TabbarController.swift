//
//  TabbarController.swift
//  TabbarExample
//
//  Created by Nguyen Duc Hoang on 8/21/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {
    var viewController1: ViewController1?
    var viewController2: ViewController2?
    var viewController3: ViewController3?
    var subviewControllers:[UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        viewController1 = ViewController1()
        viewController2 = ViewController2()
        viewController3 = ViewController3()
        
        subviewControllers.append(viewController1!)
        subviewControllers.append(viewController2!)
        subviewControllers.append(viewController3!)
        
        viewController1?.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "icon-item1"), selectedImage: #imageLiteral(resourceName: "icon-item1-selected"))
        viewController1?.tabBarItem.tag = 0
        viewController2?.tabBarItem = UITabBarItem(title: "Calendar", image: #imageLiteral(resourceName: "icon-item2"), selectedImage: #imageLiteral(resourceName: "icon-item2-selected"))
        viewController2?.tabBarItem.tag = 1
        viewController3?.tabBarItem = UITabBarItem(title: "Calendar", image: #imageLiteral(resourceName: "icon-item3") , selectedImage: #imageLiteral(resourceName: "icon-item3-selected"))
        viewController3?.tabBarItem.tag = 2
        
        self.setViewControllers(subviewControllers, animated: true)
        
        self.selectedIndex = 0
        self.selectedViewController = viewController1
        self.tabBar.tintColor = .red
        // Do any additional setup after loading the view.
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            print("tab 0")
            tabBar.tintColor = .red
        case 1:
            print("tab 1")
            self.tabBar.tintColor = .green
        case 2:
            print("tab 2")
            self.tabBar.tintColor = .blue
        default:
            print("no tab")
        }
    }

}
