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
        setupViews()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        makeNavigationBarVisible = false
        navigationController?.navigationBarHidden = true
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

