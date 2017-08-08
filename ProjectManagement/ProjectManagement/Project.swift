//
//  Project.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-06.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import Foundation
import RealmSwift



class Project : Object {
    dynamic var projectId : String = UUID().uuidString
    dynamic var name : String = ""
    dynamic var startingDate : Date?
    dynamic var finishingDate : Date?
    var tasks = List<Task>()
    
    
    override class func primaryKey() -> String {
        return "projectId"
    }
    
    // calculate the number of toDo and inProgress and done tasks
    func calculateNumberOfToDoInProgressDoneTasks() -> [Int]{
        var taskStatusArray :  [Int]?
        var numberOfToDo = 0
        var numberOfInProgress = 0
        var numberofDone = 0
        for task in tasks {
            if task.status == .TODO {
                numberOfToDo += 1
            }else if task.status == .INPROGRESS {
                numberOfInProgress += 1
            }else {
                numberofDone += 1
            }
        }
        taskStatusArray = [numberOfToDo,numberOfInProgress,numberofDone]
        return taskStatusArray!
    }
    // calculate time left to finish
    func dateDuration() -> TimeInterval{
        var durationDate = DateInterval(start: startingDate!, end: finishingDate!)
        return durationDate.duration
    }
}
