//
//  InProgressTableViewCell.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-08.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit

class InProgressTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfInProgressTsksLabel: UILabel!
    
    weak var delegate : ToDoCellDelegate?
    var taskSelected : Task!
    var project : Project!
    var index  : IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // set label and properties of cell from table view
    func setLabelAndCell(withTask taskFromToDo : Task, withProject projectFromToDo : Project, index  :IndexPath){
        self.project = projectFromToDo
        self.taskSelected = taskFromToDo
        self.index = index
        self.nameOfInProgressTsksLabel.text = self.taskSelected.nameOfTask
    }

    @IBAction func goToDoneTasksButton(_ sender: UIButton) {
        delegate?.changeStutusOfTask(forProject: project, forTask : taskSelected)
        delegate?.deleteFromArray(withIndex: index)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


