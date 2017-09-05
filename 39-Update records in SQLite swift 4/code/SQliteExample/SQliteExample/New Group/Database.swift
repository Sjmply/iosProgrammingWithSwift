//
//  Database.swift
//  SQliteExample
//
//  Created by Nguyen Duc Hoang on 9/2/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import SQLite

class Database {
    static let shared = Database()
    public let connection: Connection?
    public let databaseFileName = "sqliteExample.sqlite3"
    private init() {
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as String!
        do {
            connection = try Connection("\(dbPath!)/(databaseFileName)")
        } catch {
            connection = nil
            let nserror = error as NSError
            print("Cannot connect to Database. Error is: \(nserror), \(nserror.userInfo)")
        }
    }
}


