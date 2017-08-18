//
//  DatabaseManager.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-06.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import Foundation
import RealmSwift


// MARK: - Save Data
public func saveData<T:Object>(_ object: T) {
    let realm = try! Realm()
    try! realm.write {
        realm.add(object, update: true)
    }
}

// MARK: - Read Data

/// #### Read Data from Realm DB
/// This method reads data from Realm DB and returns with completion block
/// - Parameter: model - Type of model to be read from Realm DB
/// - Parameter: predicate - predicate string such as "color = 'tan' AND name BEGINSWITH 'B'"
/// - Parameter: completion: completion handler closure to return data
/// - Returns: It is Void since it uses completion for call backs
public func readData<T:Object>(_ model: T.Type, predicate: String?, completion: (_ responseData:Results<T>) -> Void) {
    
    let realm = try! Realm()
    let result: Results<T>
    if let predicateString = predicate {
        result = realm.objects(model).filter(predicateString)
    } else {
        result = realm.objects(model)
    }
    completion(result)
    
    
}

// MARK: - Delete

/// #### Delete a model from Realm DB
/// This method deletes a specific model from Realm DB
/// - Parameter: model - type of the model that is subclass of a Object and will be deleted
public func deleteFromDatadase<T:Object>(_ model: T) {
    let realm = try! Realm()
    
    try! realm.write {
        
        realm.delete(model)
        
    }
}

/// #### Delete All
/// This method deletes all objects from Realm DB
/// - Important: Be cautious when using it, data will not be recoverable!
public func deleteAll() {
    let realm = try! Realm()
    try! realm.write {
        realm.deleteAll()
    }
}

// update realm database
public func updateData<T:Object>(_ object: T) {
    let realm = try! Realm()
    try! realm.write {
    }
}

// update task status
func updateTaskStatus<T:Object>(_ object: T,forTaskId : String,taskStatus : String ) {
    let realm = try! Realm()
    try! realm.write {
        realm.create(Task.self, value: ["taskId": forTaskId,"status" : taskStatus ], update: true)
    }
}

// update project
func updateProjectInDatabase(project: Project,name : String?, start : Date?,finish : Date?, task : Task?) {
    let realm = try! Realm()
    try! realm.write {
        if let name = name {
            project.name = name
        }
        if let start = start {
            project.startingDate = start
        }
        if let finish = finish {
             project.finishingDate = finish
        }
        if let task = task {
            project.tasks.append(task)
        }
        realm.add(project, update: true)
    }
}
