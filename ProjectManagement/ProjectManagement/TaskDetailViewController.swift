//
//  TaskDetailViewController.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-18.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    var task : Task!
    
    @IBOutlet weak var nameOfTaskField: UILabel!
    @IBOutlet weak var dateOfStartField: UILabel!
    @IBOutlet weak var dateOFinishField: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameOfTaskField.text = self.task.nameOfTask
        dateOfStartField.text = dateToString(self.task.startDate)
        dateOFinishField.text = dateToString(self.task.finishDate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
