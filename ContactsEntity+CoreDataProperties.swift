//
//  ContactsEntity+CoreDataProperties.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 12/13/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//
//

import Foundation
import CoreData


extension ContactsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactsEntity> {
        return NSFetchRequest<ContactsEntity>(entityName: "ContactsEntity")
    }

    @NSManaged public var contactEmail: String?
    @NSManaged public var contactAddress1: String?
    @NSManaged public var contactAddress2: String?
    @NSManaged public var contactCity: String?
    @NSManaged public var contactName: String?
    @NSManaged public var contactPhone: String?
    @NSManaged public var contactState: String?
    @NSManaged public var contactZip: String?

}
