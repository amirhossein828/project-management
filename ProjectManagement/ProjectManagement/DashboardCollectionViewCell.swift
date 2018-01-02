//
//  DashboardCollectionViewCell.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-06.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit
import CircleProgressView

class DashboardCollectionViewCell: UICollectionViewCell {
    
    // index of cell which delete button get taped on it
    var index : IndexPath!
    weak var delegate : DashboardCellDelegate?
    
    
    @IBOutlet weak var progressBar: CircleProgressView!
    @IBOutlet weak var timeLeftToDueDate: UILabel!
    @IBOutlet weak var toDoLabel: UILabel!
    @IBOutlet weak var inProgressLabel: UILabel!
    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var dayLeft: UILabel!
    @IBOutlet weak var nameOfProjectLabel: UILabel!
    
    func setIndexPath(withIndex index : IndexPath){
        self.index = index
    }
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 15
    }
    

    @IBAction func deleteFromCollectionBtn(_ sender: UIButton) {
        delegate?.deleteCell(withIndexPath : index)
    }

}

// protocol to delegate delete method to dashboadViewController
protocol DashboardCellDelegate : class{
    // method to delete cell
    func deleteCell(withIndexPath index : IndexPath)
}
