//
//  DetailViewController.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-07.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var projectName: UILabel!
    
    @IBOutlet weak var toDoView: UIView!
    
    @IBOutlet weak var doneView: UIView!
    @IBOutlet weak var inProgressView: UIView!
    
    
    var projectFromDashboard : Project? = nil
    
    @IBAction func changeContainerViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.toDoView.alpha = 1
                self.inProgressView.alpha = 0
                self.doneView.alpha = 0
            })
        } else if sender.selectedSegmentIndex == 1 {
            UIView.animate(withDuration: 0.5, animations: {
                self.toDoView.alpha = 0
                self.inProgressView.alpha = 1
                self.doneView.alpha = 0
            })
        }else {
            UIView.animate(withDuration: 0.5, animations: {
                self.toDoView.alpha = 0
                self.inProgressView.alpha = 0
                self.doneView.alpha = 1
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.projectName.text = self.projectFromDashboard?.name

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
