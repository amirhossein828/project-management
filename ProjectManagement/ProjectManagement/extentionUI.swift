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
    
