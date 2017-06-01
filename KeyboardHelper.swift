//
//  KeyboardHelper.swift
//
//  Copyright © 2017 Cameron Johns. All rights reserved.
//

import Foundation
import UIKit

// Class Extensions
extension UIViewController {
    
    // Register for tap
    func hideKeyboardWhenInteractingWithView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false;
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Register for keyboard events
    func keyboardScrollSetup() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // Shift view up and down if view being hidden under keyboard
    func keyboardWillShow(notification:Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                var origHeight:CGFloat = 0.0;
                for view in self.view.subviews {
                    if(view.isFirstResponder) {
                        origHeight = view.frame.origin.y
                    }
                }
                if((self.view.frame.height - origHeight) <= keyboardSize.height + 50)
                {
                    self.view.frame.origin.y -= (keyboardSize.height + 50) - (self.view.frame.height - origHeight)
                }
            }
        }
    }
    
    func keyboardWillHide(notification:Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                var origHeight:CGFloat = 0.0;
                for view in self.view.subviews {
                    if(view.isFirstResponder) {
                        origHeight = view.frame.origin.y
                    }
                }
                if((self.view.frame.height - origHeight) <= keyboardSize.height + 50)
                {
                    self.view.frame.origin.y += (keyboardSize.height + 50) - (self.view.frame.height - origHeight)
                }
            }
        }
    }
}

