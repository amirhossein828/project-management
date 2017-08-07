//
//  Utils.swift
//  ProjectManagement
//
//  Created by seyedamirhossein hashemi on 2017-08-06.
//  Copyright © 2017 seyedamirhossein hashemi. All rights reserved.
//

import Foundation


// convert string to date
 func dateFromString(_ dateAsString: String?) -> Date? {
    guard let string = dateAsString else { return nil }
    
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSS"
    let val = dateformatter.date(from: string)
    return val
}

// convert date to String
 func dateToString(_ dateIn: Date?) -> String? {
    guard let date = dateIn else { return nil }
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSS"
    let val = dateformatter.string(from: date)
    return val
}



