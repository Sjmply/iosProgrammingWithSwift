//
//  DepartmentModel.swift
//  SQliteExample
//
//  Created by Nguyen Duc Hoang on 9/1/17.
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
            }
        } catch {
            let nserror = error as NSError
            print("Create table tblDepartment failed. Error is: \(nserror), \(nserror.userInfo)")
        }
    }
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
    func queryAll() -> AnySequence<Row>? {
        do {            
            return try Database.shared.connection?.prepare(self.tblDepartment)
        } catch {
            let nserror = error as NSError
            print("Cannot query all tblDepartment. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    func toString(department: Row) {
        print("""
            Department details. Name = \(department[self.name]),\
            address = \(department[self.address]),
            city = \(department[self.city]),
            zipCode = \(department[self.zipCode]))
        """)
    }
}

























