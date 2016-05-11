//
//  TWBaseFormViewController.swift
//  taskwizard
//
//  Created by Tejas Nikumbh on 5/11/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class TWBaseFormViewController: UIViewController {

    @IBOutlet weak var rootScrollView:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestureRecognizers()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        registerObservers()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        deregisterObservers()
    }
    
    deinit {
        deregisterObservers()
    }
    
    /* ================================ View Config Methods =========================================== */
    func setupGestureRecognizers() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                            action: #selector(DisplayViewController.resignKeyboard(_:)))
        tapGestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func registerObservers() {
        startObservingKeyboard()
    }
    
    func deregisterObservers() {
        stopObservingKeyboard()
    }
    
    func startObservingKeyboard() {
        NSNotificationCenter.defaultCenter().addObserver(self,
                                    selector:#selector(DisplayViewController.keyboardWillShow(_:)),
                                        name:UIKeyboardWillShowNotification,
                                    object:nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
                                    selector:#selector(DisplayViewController.keyboardWillHide(_:)),                                                name:UIKeyboardWillHideNotification,
                                    object:nil)
    }
    
    func stopObservingKeyboard() {
        NSNotificationCenter.defaultCenter().removeObserver(self,
                                                name: UIKeyboardWillShowNotification,
                                                object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self,
                                                name: UIKeyboardWillHideNotification,
                                                object: nil)
    }
    
    /* ==================================== Selectors =========================================== */
    func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize: CGSize = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue.size {
                let contentInset = UIEdgeInsetsMake(0.0, 0.0,
                                                    keyboardSize.height, 0.0);
                rootScrollView.contentInset = contentInset
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        let contentInset = UIEdgeInsetsZero
        rootScrollView.contentInset = contentInset
    }
    
    func resignKeyboard(gestureRecognizer: UITapGestureRecognizer? = nil) {
        view.endEditing(true)
    }

}
