//
//  DataTasksViewController.swift
//  taskwizard
//
//  Created by Tejas Nikumbh on 5/9/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class DataTasksViewController: TWBaseFormViewController {
   
    var placeHolderMode = true
    var ownServer = false
    
    @IBOutlet weak var dataTaskDescritpion: UITextView!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func yesButtonTapped(sender: UIButton)  {
        yesButton.backgroundColor = UIColor.buttonEnableColor()
        noButton.backgroundColor = UIColor.buttonDisableColor()
        ownServer = true
        
    }
    
    @IBAction func noButtonTapped(sender: UIButton)  {
        noButton.backgroundColor = UIColor.buttonEnableColor()
        yesButton.backgroundColor = UIColor.buttonDisableColor()
        ownServer = false
    }
}

extension DataTasksViewController: UITextViewDelegate {
    func textViewDidBeginEditing(textView: UITextView) {
        if(textView == dataTaskDescritpion) {
            if(placeHolderMode) {
                textView.textColor = UIColor.darkGrayColor()
                textView.text = ""
            }
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if(textView == dataTaskDescritpion) {
            if(textView.text == "") {
                textView.textColor = UIColor.lightGrayColor()
                textView.text = "Enter a brief description of your task. Note that we currently support only Image Labelling tasks..."
                placeHolderMode = true
            } else {
                placeHolderMode = false
            }
        }
    }
}
