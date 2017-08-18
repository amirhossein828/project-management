//
//  Task.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-06.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import Foundation
import RealmSwift

class Task : Object{
    dynamic var taskId : String = UUID().uuidString
    dynamic var nameOfTask : String = ""
    dynamic var status : TaskStatus.RawValue = TaskStatus.TODO.rawValue
    dynamic var startDate  :Date = Date()
    dynamic var finishDate : Date?
     var duration : Double? {
        get {
            var timeDifference : Double? = nil
            if let finish = finishDate {
            timeDifference =  finish.timeIntervalSince(startDate)
            }
            return timeDifference
        }
    }

    override class func primaryKey() -> String {
        return "taskId"
    }
    

}

// status of task
enum TaskStatus : String {
    case TODO = "todo",INPROGRESS = "inProgress",DONE = "done"
}
