//
//  DisplayViewController.swift
//  taskwizard
//
//  Created by Tejas Nikumbh on 5/9/16.
//  Copyright © 2016 Personal. All rights reserved.
//
import UIKit

class DisplayViewController: UIViewController {
        
    @IBOutlet weak var rootScrollView: UIScrollView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
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
                        selector:#selector(DisplayViewController.keyboardWillHide(_:)),
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
    
    /* ==================================== IB Actions =========================================== */
    @IBAction func signInTapped(sender: UIButton) {
        if(true) {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("HomeViewNavigationController")
            viewController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            presentViewController(viewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func forgotPasswordTapped(sender: UIButton) {}
   
}
