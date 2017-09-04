//
//  DepartmentEntity.swift
//  SQliteExample
//
//  Created by Nguyen Duc Hoang on 9/2/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import SQLite
class DepartmentEntity {
    static let shared = DepartmentEntity()
    
    private let tblDepartment = Table("tblDepartment")
    
    private let id = Expression<Int64>("id")
    private let name = Expression<String>("name")
    private let address = Expression<String>("address")
    private let city = Expression<String>("city")
    private let zipCode = Expression<Int64>("zipCode")
    
    private init() {
        //Create table if not exists
        do {
            if let connection = Database.shared.connection {
                try connection.run(tblDepartment.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { (table) in
                    table.column(self.id, primaryKey: true)
                    table.column(self.name)
                    table.column(self.address)
                    table.column(self.city)
                    table.column(self.zipCode)
                }))
                print("Create table tblDepartment successfully")
            } else {
                print("Create table tblDepartment failed.")
            }
        } catch {
            let nserror = error as NSError
            print("Create table tblDepartment failed. Error is: \(nserror), \(nserror.userInfo)")
        }
    }
    //Insert a record to tblDepartment
    func insert(name: String, address: String, city: String, zipCode: Int64?) -> Int64? {
        do {
            let insert = tblDepartment.insert(self.name <- name,
                                              self.address <- address,
                                              self.city <- city,
                                              self.zipCode <- zipCode ?? 0)
            let insertedId = try Database.shared.connection!.run(insert)
            return insertedId
        } catch {
            let nserror = error as NSError
            print("Cannot insert new Department. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
        
    }
    //How to query(find) all records in tblDepartment ?
    func queryAll() -> AnySequence<Row>? {
        do {
            return try Database.shared.connection?.prepare(self.tblDepartment)
        } catch {
            let nserror = error as NSError
            print("Cannot query(list) all tblDepartment. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    func filter() -> AnySequence<Row>? {
        do {
            
            //SELECT * FROM "tblDepartment" WHERE ("id" = 1)
//            let filterCondition = (id == 1)
            
            //SELECT * FROM "users" WHERE ("id" IN (1, 2, 3, 4, 5))
            //let filterCondition = [1, 2, 3, 4, 5].contains(id)
            
            let filterCondition = name.like("%Department%")
            
            return try Database.shared.connection?.prepare(self.tblDepartment.filter(filterCondition))
            
            //return try Database.shared.connection?.prepare(self.tblDepartment.filter([1, 2, 3, 4, 5].contains(id))
        } catch {
            let nserror = error as NSError
            print("Cannot list / query objects in tblDepartment. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }        
    
//    ``` swift
//    746: users.filter(id == 1)
//    747  // SELECT * FROM "users" WHERE ("id" = 1)
//    748
//    749: users.filter([1, 2, 3, 4, 5].contains(id))
//    750  // SELECT * FROM "users" WHERE ("id" IN (1, 2, 3, 4, 5))
//    751
//    752: users.filter(email.like("%@mac.com"))
//    753  // SELECT * FROM "users" WHERE ("email" LIKE '%@mac.com')
//    754
//    755: users.filter(verified && name.lowercaseString == "alice")
//    756  // SELECT * FROM "users" WHERE ("verified" AND (lower("name") == 'alice'))
//    757
//    758: users.filter(verified || balance >= 10_000)
//    759  // SELECT * FROM "users" WHERE ("verified" OR ("balance" >= 10000.0))
//    760  ```
    
    func toString(department: Row) {
        print("""
            Department details. id = \(department[self.id]),
            Name = \(department[self.name]),
            address = \(department[self.address]),
            city = \(department[self.city]),
            zipCode = \(department[self.zipCode]))
            """)
    }
}
