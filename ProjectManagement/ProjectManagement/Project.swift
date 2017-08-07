//
//  Project.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-06.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper



class Project : Object {
    dynamic var projectId : String = UUID().uuidString
    dynamic var name : String = ""
    dynamic var startingDate : Date?
    dynamic var finishingDate : Date?
    var tasks = List<Task>()
    
    override class func primaryKey() -> String {
        return "projectId"
    }
    
}
