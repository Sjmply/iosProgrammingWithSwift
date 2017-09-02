//
//  EmployeeEntity.swift
//  SQliteExample
//
//  Created by Nguyen Duc Hoang on 9/2/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import SQLite
class EmployeeEntity {
    static let shared = EmployeeEntity()
    
    private let tblEmployee = Table("tblEmployee")
    
    private let id = Expression<Int64>("id")
    private let name = Expression<String>("name")
    private let hireDate = Expression<Date>("hireDate")
    private let identifier = Expression<String>("identifier")
    private let isManager = Expression<Bool>("isManager")
    private let title = Expression<String>("title")
    
    private let departmentId = Expression<Int64>("departmentId")
    
    private init() {
        //Create table if not exists
        do {
            if let connection = Database.shared.connection {
                try connection.run(tblEmployee.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { (table) in
                    table.column(self.id, primaryKey: true)
                    table.column(self.name)
                    table.column(self.hireDate)
                    table.column(self.identifier)
                    table.column(self.isManager)
                    table.column(self.title)
                    table.column(self.departmentId)
                }))
                print("Create table tblEmployee successfully")
            }
        } catch {
            let nserror = error as NSError
            print("Create table employees failed. Error is: \(nserror), \(nserror.userInfo)")
        }
    }
    //Do the same with function "insert" as in DepartmentEntity
    func insert(name: String, hireDate: Date, identifier: String, isManager: Bool, title: String?, departmentId: Int64?) -> Int64? {
        do {
            let insert = tblEmployee.insert(self.name <- name,
                                            self.hireDate <- hireDate,
                                            self.identifier <- identifier,
                                            self.isManager <- isManager,
                                            self.title <- title ?? "",
                                            self.departmentId <- departmentId ?? 0)
            let insertedId = try Database.shared.connection!.run(insert)
            return insertedId
        } catch {
            let nserror = error as NSError
            print("Cannot insert new Employee. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    func queryAll() -> AnySequence<Row>? {
        do {
            return try Database.shared.connection?.prepare(self.tblEmployee)
        } catch {
            let nserror = error as NSError
            print("Cannot query all Employees. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    
    func toString(employee: Row) {
        print("""
            Employee details: name = \(employee[self.name]),
            hireDate = \(employee[self.hireDate]),
            identifier = \(employee[self.identifier]),
            isManager = \(employee[self.isManager]),
            title = \(employee[self.title]))
            departmentId = \(employee[self.departmentId]))
            """)
    }
}
