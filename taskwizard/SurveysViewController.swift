//
//  SurveysViewController.swift
//  taskwizard
//
//  Created by Tejas Nikumbh on 5/9/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class SurveysViewController: TWBaseFormViewController {
    
    var placeHolderMode = true
    var sector:Sector = .UNSPECIFIED
    
    @IBOutlet weak var surveysDescription: UITextView!
    @IBOutlet weak var financeButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func travelButtonTapped(sender: AnyObject) {
        sector = .TRAVEL
        travelButton.backgroundColor = UIColor.buttonEnableColor()
        financeButton.backgroundColor = UIColor.buttonDisableColor()
    }
    
    @IBAction func financeButtonTapped(sender: AnyObject) {
        sector = .FINANCE
        financeButton.backgroundColor = UIColor.buttonEnableColor()
        travelButton.backgroundColor = UIColor.buttonDisableColor()
    }
    
}

extension SurveysViewController: UITextViewDelegate {
    func textViewDidBeginEditing(textView: UITextView) {
        if(textView == surveysDescription) {
            if(placeHolderMode) {
                textView.textColor = UIColor.darkGrayColor()
                textView.text = ""
            }
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if(textView == surveysDescription) {
            if(textView.text == "") {
                textView.textColor = UIColor.lightGrayColor()
                textView.text = "Enter a brief description of your startup. Please limit it to once sentence with less than 160 characters..."
                placeHolderMode = true
            } else {
                placeHolderMode = false
            }
        }
    }
}
