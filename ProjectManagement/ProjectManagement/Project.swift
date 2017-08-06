//
//  Project.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-06.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import Foundation

class Project {
    var name : String
    var startingDate : Date
    var finishingDate : Date
    var tasks : [Task]?
    
    init(nameOfProject : String , start  : Date , finish : Date) {
        self.name = nameOfProject
        self.startingDate = start
        self.finishingDate = finish
    }
   
}
