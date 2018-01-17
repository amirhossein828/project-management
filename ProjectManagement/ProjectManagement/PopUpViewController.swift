//
//  PopUpViewController.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-07.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var nameOfTaskField: UITextField!
    
    //MARK: - Properties
    weak var delegate : TaskPopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // make the corner of view radius
        self.popUpView.layer.cornerRadius = 20
        hideKeyboardWhenTappedAround()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - actions
    @IBAction func doneButton(_ sender: UIButton) {
        let task = Task()
        guard let name = self.nameOfTaskField.text else { return  }
        task.nameOfTask = name
        task.status = TaskStatus.TODO.rawValue
        print(task.status)
        self.delegate?.upDateProjectTask(newTask: task)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

 

}
