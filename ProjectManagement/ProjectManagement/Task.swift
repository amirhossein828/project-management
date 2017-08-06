//
//  Task.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-06.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import Foundation

class Task {
    var nameOfTask : String
    var status : TaskStatus
    var startDate  :Date
    var finishDate : Date?
    var duration : Double? {
        get {
            var timeDifference : Double? = nil
            if let finish = finishDate {
            timeDifference =  finish.timeIntervalSince(startDate)
            }
            return timeDifference
        }
    }
    
    // initialize with name and current date and todo status
    init(name : String) {
        self.nameOfTask = name
        self.status = .TODO
        self.startDate = Date()
    }
}

// status of task
enum TaskStatus {
    case TODO,INPROGRESS,DONE
}
