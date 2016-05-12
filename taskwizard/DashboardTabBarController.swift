//
//  DashboardTabBarController.swift
//  taskwizard
//
//  Created by Tejas Nikumbh on 5/12/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class DashboardTabBarController: UITabBarController {
    override func viewDidLoad() {
        UITabBar.appearance().tintColor = UIColor.grayColor()
        UITabBar.appearance().barTintColor = UIColor.whiteColor()
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSFontAttributeName: UIFont.systemFontOfSize(12.0, weight: UIFontWeightSemibold),
                NSForegroundColorAttributeName: UIColor.lightGrayColor()],
            forState: .Normal)
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSFontAttributeName: UIFont.systemFontOfSize(12.0, weight: UIFontWeightSemibold),
                NSForegroundColorAttributeName: UIColor.blackColor()],
            forState: .Selected)
    }
    
    override func viewWillLayoutSubviews() {
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = 40
        tabFrame.origin.y = self.view.frame.size.height - 40
        self.tabBar.frame = tabFrame
    }
}
