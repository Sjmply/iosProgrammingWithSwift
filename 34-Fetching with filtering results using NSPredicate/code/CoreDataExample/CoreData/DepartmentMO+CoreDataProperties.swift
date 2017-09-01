//
//  DepartmentMO+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Nguyen Duc Hoang on 8/30/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//
//

import Foundation
import CoreData


extension DepartmentMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DepartmentMO> {
        return NSFetchRequest<DepartmentMO>(entityName: "Department")
    }

    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var name: String?
    @NSManaged public var zipCode: Int32
    @NSManaged public var employees: NSSet?

}

// MARK: Generated accessors for employees
extension DepartmentMO {

    @objc(addEmployeesObject:)
    @NSManaged public func addToEmployees(_ value: EmployeeMO)

    @objc(removeEmployeesObject:)
    @NSManaged public func removeFromEmployees(_ value: EmployeeMO)

    @objc(addEmployees:)
    @NSManaged public func addToEmployees(_ values: NSSet)

    @objc(removeEmployees:)
    @NSManaged public func removeFromEmployees(_ values: NSSet)
    
    static func insertNewDepartment(address: String, city: String, name: String, zipCode: Int32) -> DepartmentMO? {
        let department = NSEntityDescription.insertNewObject(forEntityName: "Department", into: AppDelegate.managedObjectContext!) as! DepartmentMO
        department.address = address
        department.city = city
        department.name = name
        department.zipCode = zipCode
        do {
            try AppDelegate.managedObjectContext?.save()
        } catch {
            let nserror = error as NSError
            print("Cannot insert new department. Error is: \(nserror), \(nserror.userInfo)")
            return nil
        }
        print("Insert department with name: \(department.name ?? "") successful")
        return department
    }
    static func fetchDepartmentsWithFilter(nameContains: String?, nameExactly: String?) -> [DepartmentMO] {
        var result = [DepartmentMO]()
        let moc = AppDelegate.managedObjectContext
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = DepartmentMO.fetchRequest()
        var subPredicates = [NSPredicate]()
        if nameContains != nil {
            //let predicate1 = NSPredicate(format: "name contains[cd] %@", nameContains!) //cd =  Case and diacritic insensitive lookups
            let predicate1 = NSPredicate(format: "name contains %@", nameContains!)//Case sensitive lookups
            subPredicates.append(predicate1)
        }
        if nameExactly != nil {
            let predicate2 = NSPredicate(format: "name == %@", nameExactly!)
            subPredicates.append(predicate2)
        }
        if subPredicates.count > 0 {
            let compoundPredicates = NSCompoundPredicate.init(type: .and, subpredicates: subPredicates)
            fetchRequest.predicate = compoundPredicates
        }
        do {
            result = try moc!.fetch(fetchRequest) as! [DepartmentMO]
        } catch {
            print("Cannot fetch employees.Error \(error)")
            return result
        }
        return result
    }
    func toString() {
        print("Department's details. Name = \(name ?? ""), address: \(address ?? ""), city: \(city ?? ""), zipCode: \(zipCode)")
        if let employeeList = self.employees {
            if employeeList.count == 0 {
                return
            }
            print("Department's employees details: ")
            for eachEmployee in employeeList {
                (eachEmployee as! EmployeeMO).toString()
            }
        }
    }

}












