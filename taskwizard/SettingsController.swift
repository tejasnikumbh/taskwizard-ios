//
//  SettingsController.swift
//  taskwizard
//
//  Created by Tejas Nikumbh on 5/12/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class SettingsController: TWBaseFormViewController {

    @IBAction func backButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func logoutButtonTapped(sender: AnyObject) {
        // Also need to store in NSUserDefaults
        TWUser.isLoggedIn = false
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
