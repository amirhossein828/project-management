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
        realm.add(object)
        
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

// update project name
func updateProject<T:Object>(_ object: T,forProjectId : String,projectName : String ) {
    let realm = try! Realm()
    try! realm.write {
        realm.create(Project.self, value: ["projectId":forProjectId,"name" : projectName ], update: true)
    }
}

// update task status
func updateTaskStatus<T:Object>(_ object: T,forTaskId : String,taskStatus : String ) {
    let realm = try! Realm()
    try! realm.write {
        realm.create(Task.self, value: ["taskId": forTaskId,"status" : taskStatus ], update: true)
    }
}
