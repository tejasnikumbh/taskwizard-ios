//
//  HomeViewController.swift
//  taskwizard
//
//  Created by Tejas Nikumbh on 5/9/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var makeNavigationBarVisible = false
    
    @IBOutlet weak var rootScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserDetails()
        setupViews()
    }
    
    override func viewWillAppear(animated: Bool) {
        // Check if user is logged in, else show the login screen
        if((TWUser.isLoggedIn)!) {
            super.viewWillAppear(animated)
            makeNavigationBarVisible = false
            navigationController?.navigationBarHidden = true
        } else {
            let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginViewController") as! DisplayViewController
            presentViewController(loginViewController, animated: true, completion: nil)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if(makeNavigationBarVisible) {
            navigationController?.navigationBarHidden = false
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "toTasks") {
            makeNavigationBarVisible = true
        }
    }
    /* ======================================= General Configs ===================================================== */
    func setupUserDetails() {
        // Should be done via NSUserDefaults
        TWUser.isLoggedIn = false
    }
    
    /* =========================================== View Configs ===================================================== */
    func setupViews() {
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont.systemFontOfSize(14.0, weight: UIFontWeightSemibold),
            NSForegroundColorAttributeName: UIColor.darkGrayColor()]
        rootScrollView.scrollEnabled = false
    }
    
    
    /* ============================================ IB Actions ===================================================== */
    
   
    
    /* =========================================== Common ===================================================== */
}

