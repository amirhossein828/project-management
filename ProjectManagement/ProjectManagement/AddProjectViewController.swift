//
//  AddProjectViewController.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-06.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit
import RealmSwift


class AddProjectViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var nameOfProjectField: UITextField!
    @IBOutlet weak var startingdateField: UITextField!
    @IBOutlet weak var finishingdateField: UITextField!
    //MARK: - Properties
    let project = Project()
    
    //MARK: - actions
    @IBAction func doneButoon(_ sender: UIBarButtonItem) {
        guard let nameOfproject = self.nameOfProjectField.text,
            let startDate = dateFromString(self.startingdateField.text),
            let finishdate = dateFromString(self.finishingdateField.text)
            else { return  }
        project.name = nameOfproject
        project.startingDate = startDate
        project.finishingDate = finishdate
        saveData(project)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
