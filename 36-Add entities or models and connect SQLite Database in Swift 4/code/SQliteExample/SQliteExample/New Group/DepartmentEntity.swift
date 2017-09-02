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
    func toString(department: Row) {
        print("""
            Department details. Name = \(department[self.name]),\
            address = \(department[self.address]),
            city = \(department[self.city]),
            zipCode = \(department[self.zipCode]))
            """)
    }
}
