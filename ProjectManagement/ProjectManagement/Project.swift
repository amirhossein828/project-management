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
            if task.status == TaskStatus.TODO.rawValue {
                numberOfToDo += 1
            }else if task.status == TaskStatus.INPROGRESS.rawValue {
                numberOfInProgress += 1
            }else {
                numberofDone += 1
            }
        }
        taskStatusArray = [numberOfToDo,numberOfInProgress,numberofDone]
        return taskStatusArray!
    }
    // calculate time left to finish based on day and hour
    func timeToFinish() -> [Int]{
        let currentdate = Date()
        guard let finishDate = finishingDate else { return [0,0] }
        if finishDate > currentdate {
        let durationDate = DateInterval(start: currentdate, end: finishDate).duration
        let day = Int(durationDate) / 43200
        let hour = (Int(durationDate) - (day * 43200)) / 3600
        return [day,hour]
        }else {
            return [0,0]
        }
    }
    
    // percentage of progress of based on done projects
    func projectProgress() -> Float{
        let numberOfTasks = tasks.count
        var numberofDoneTasks = 0
        for task in tasks {
            if task.status == TaskStatus.DONE.rawValue {
                numberofDoneTasks += 1
            }
        }
        return Float(numberofDoneTasks) / Float(numberOfTasks)
    }
    // test 33
}
