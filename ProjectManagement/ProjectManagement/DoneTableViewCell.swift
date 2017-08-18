//
//  DoneTableViewCell.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-18.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit

class DoneTableViewCell: UITableViewCell {
    
    var taskSelected : Task!

    @IBOutlet weak var nameOfTaskField: UILabel!
    
    @IBAction func taskDetailButton(_ sender: UIButton) {
//      delegate.setTaskInDetailTaskViewController()
        
    }
    
    
    
    // set label and properties of cell from table view
    func setLabelAndCell(withTask task : Task){
        self.taskSelected = task
        self.nameOfTaskField.text = self.taskSelected.nameOfTask
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
