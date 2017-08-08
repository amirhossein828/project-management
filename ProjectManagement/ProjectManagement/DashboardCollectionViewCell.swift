//
//  DashboardCollectionViewCell.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-06.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import UIKit

class DashboardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var timeLeftToDueDate: UILabel!
    
    @IBOutlet weak var toDoLabel: UILabel!
    
    @IBOutlet weak var inProgressLabel: UILabel!
    
    @IBOutlet weak var doneLabel: UILabel!
    
    @IBOutlet weak var nameOfProjectLabel: UILabel!
}
