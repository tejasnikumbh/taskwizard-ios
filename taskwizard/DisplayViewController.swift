//
//  DisplayViewController.swift
//  taskwizard
//
//  Created by Tejas Nikumbh on 5/9/16.
//  Copyright © 2016 Personal. All rights reserved.
//
import UIKit

class DisplayViewController: TWBaseFormScrollHijackViewController {
        
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    /* ==================================== IB Actions =========================================== */
    @IBAction func signInTapped(sender: UIButton) {
        // Should check with sign In info from server
        if(true) {
            TWUser.isLoggedIn = true
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func forgotPasswordTapped(sender: UIButton) {}
   
}
