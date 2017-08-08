//
//  ToDoTableViewCell.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-08.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var goInProgressButton: UIButton!
    @IBOutlet weak var nameOfTaskLabel: UILabel!
    
    weak var delegate : ToDoCellDelegate?
    var taskSelected : Task!
    var project : Project!
    var index  : IndexPath!
    
    @IBAction func changeStutusToInProgress(_ sender: UIButton) {
        delegate?.changeStutusOfTask(forProject: project, forTask : taskSelected)
        delegate?.deleteFromArray(withIndex: index)
    }
    
    // set label and properties of cell from table view
    func setLabelAndCell(withTask taskFromToDo : Task, withProject projectFromToDo : Project, index  :IndexPath){
        self.project = projectFromToDo
        self.taskSelected = taskFromToDo
        self.index = index
        self.nameOfTaskLabel.text = self.taskSelected.nameOfTask
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}


// protocol for delegation of some method to ToDoTableViewController
protocol ToDoCellDelegate : class{
    // method to change the stutus of task form toDo to inProgress
    func changeStutusOfTask(forProject : Project, forTask : Task)
    // method to delete toDoTask from taskArray when the changeStutusToInProgress tapped
    func deleteFromArray(withIndex : IndexPath)
    
}
