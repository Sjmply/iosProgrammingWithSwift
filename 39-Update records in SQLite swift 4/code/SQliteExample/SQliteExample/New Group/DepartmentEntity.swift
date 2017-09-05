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
    func filter() -> AnySequence<Row>? {
        do {
            //SELECT * FROM "tblDepartment" WHERE ("id" = 1)
            let filterCondition = (id == 1)
            
            //SELECT * FROM "tblDepartment" WHERE ("id" IN (1, 2, 3, 4))
            //let filterCondition = [1, 2, 3, 4].contains(id)
            
            //SELECT * FROM "tblDepartment" WHERE ("name" LIKE '%Department')
//            let filterCondition = self.name.like("%Department")
            
            //SELECT * FROM "tblDepartment" WHERE name.lowercaseString == "sales department" AND id >= 3
            //let filterCondition = (id >= 3) && (name.lowercaseString == "sales department")
            
            //SELECT * FROM "tblDepartment" WHERE ("id" == 3) OR ("id" == 3)
//            let filterCondition = (id == 3) || (id == 4)
            
            return try Database.shared.connection?.prepare(self.tblDepartment.filter(filterCondition))
        } catch {
            let nserror = error as NSError
            print("Cannot list / query objects in tblDepartment. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    //UPDATE tblDepartment SET(name= ... and address = ... and city = ... and zipcode = ...) WHERE id == ??
    func update(id: Int64, name: String?,address:String?,city:String?,zipCode:Int64?) -> Bool {
        if Database.shared.connection == nil {
            return false
        }
        do {
            let tblFilterDepartment = self.tblDepartment.filter(self.id == id)
            var setters:[SQLite.Setter] = [SQLite.Setter]()
            if name != nil {
                setters.append(self.name <- name!)
            }
            if address != nil {
                setters.append(self.address <- address!)
            }
            if city != nil {
                setters.append(self.city <- city!)
            }
            if zipCode != nil {
                setters.append(self.zipCode <- zipCode!)
            }
            if setters.count == 0  {
                print("Nothing to update")
                return false
            }
            let update = tblFilterDepartment.update(setters)
            if try Database.shared.connection!.run(update) <= 0 {
                //Update unsuccessful
                return false
            }
            return true
        } catch {
            let nserror = error as NSError
            print("Cannot update objects in tblDepartment. Error is: \(nserror), \(nserror.userInfo)")
            return false
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
