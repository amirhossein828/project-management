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
    @IBOutlet weak var tableView: UITableView!
    //MARK: - Properties
    let project = Project()
    var taskArray = [Task]()
    var datePickerStart : UIDatePicker! = nil
    var datePickerFinish : UIDatePicker! = nil
    
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
        // table view delagate and datasource
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // make datepickeres
        datePickerStart = UIDatePicker(textField: startingdateField, target: self, action2: #selector(donePressedStart))
        datePickerFinish = UIDatePicker(textField: finishingdateField, target: self, action2: #selector(donePressedFinish))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // get called when startTextField push
    func donePressedStart(){
        self.startingdateField.text = dateToString(datePickerStart.date)
        self.startingdateField.endEditing(true)
    }
    
    // get called when finishTextField push
    func donePressedFinish(){
        self.finishingdateField.text = dateToString(datePickerFinish.date)
        self.finishingdateField.endEditing(true)
    }
    


}

// extention for updating tasks
extension AddProjectViewController : TaskPopUpDelegate {
    func upDateProjectTask(newTask: Task) {
        self.taskArray.append(newTask)
        self.project.tasks.append(newTask)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPopUp" {
            let vc = segue.destination as! PopUpViewController
            vc.delegate = self
        }
    }

    
}

// configure table view
extension AddProjectViewController :  UITableViewDelegate, UITableViewDataSource{
    // MARK: ------------------------------------------------- TableView initialization methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return number of items in item array, if it does not exist return 0
        return self.taskArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.taskArray[indexPath.row].nameOfTask
        
        return cell
    }

    
}

// protocol to update tasks of project
protocol TaskPopUpDelegate : class {
    func upDateProjectTask(newTask: Task)
}
