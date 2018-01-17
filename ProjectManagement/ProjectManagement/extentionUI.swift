//
//  extentionUI.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-07.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import Foundation
import UIKit


extension UIDatePicker {
    
    
    convenience init(textField : UITextField , target : UIViewController,action2 : Selector? ){
        self.init()
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //create bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: target, action: action2)
        toolbar.setItems([doneButton], animated:false)
        textField.inputAccessoryView = toolbar
        textField.inputView = self
        // Do any additional setup aft
        
}

}

/**
 * Extends UIViewController to hide Keyboard When Tapped Around.
 *
 * - author: Amirhossein
 *
 */
extension UIViewController {
    /// hide Keyboard When user Tapped Around of keyboard
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
    
