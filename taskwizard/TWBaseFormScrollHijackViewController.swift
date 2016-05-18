//
//  TWBaseFormScrollHijackViewController.swift
//  taskwizard
//
//  Created by Tejas Nikumbh on 5/18/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class TWBaseFormScrollHijackViewController: UIViewController {

    @IBOutlet weak var rootScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupGestureRecognizers()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        registerObservers()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        deregisterObservers()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    deinit {
        deregisterObservers()
    }
    
    /* ==================================== View Config =========================================== */
    func setupViews() {
        rootScrollView.scrollEnabled = false
    }
    
    func setupGestureRecognizers() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(TWBaseFormScrollHijackViewController.resignKeyboard(_:)))
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
                                                         selector:#selector(TWBaseFormScrollHijackViewController.keyboardWillShow(_:)),
                                                         name:UIKeyboardWillShowNotification,
                                                         object:nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector:#selector(TWBaseFormScrollHijackViewController.keyboardWillHide(_:)),
                                                         name:UIKeyboardWillHideNotification,
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
                rootScrollView.setContentOffset(CGPointMake(0, keyboardSize.height), animated: true)
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        rootScrollView.setContentOffset(CGPointZero, animated: true)
    }
    
    func resignKeyboard(gestureRecognizer: UITapGestureRecognizer? = nil) {
        view.endEditing(true)
    }
    
}
