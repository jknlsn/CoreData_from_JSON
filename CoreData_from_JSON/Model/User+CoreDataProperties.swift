//
//  User+CoreDataProperties.swift
//  CoreData_from_JSON
//
//  Created by Jake Nelson on 3/11/19.
//  Copyright © 2019 Jake Nelson. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: Int16
    @NSManaged public var first_name: String?
    @NSManaged public var last_name: String?
    @NSManaged public var email: String?
    @NSManaged public var gender: String?
    @NSManaged public var ip_address: String?

}
