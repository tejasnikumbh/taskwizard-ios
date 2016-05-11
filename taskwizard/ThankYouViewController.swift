//
//  ThankYouViewController.swift
//  taskwizard
//
//  Created by Tejas Nikumbh on 5/10/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class ThankYouViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitButtonTapped(sender: UIButton!) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func noThanksButtonTapped(sender: UIButton!) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}