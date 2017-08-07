//
//  PopUpViewController.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-07.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    
    @IBOutlet weak var popUpView: UIView!

    @IBOutlet weak var nameOfTaskField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // make the corner of view radius
        self.popUpView.layer.cornerRadius = 20

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func doneButton(_ sender: UIButton) {
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
    }

 

}
