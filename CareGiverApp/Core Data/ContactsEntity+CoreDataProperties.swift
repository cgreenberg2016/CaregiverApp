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


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var email: String?
    @NSManaged public var address1: String?
    @NSManaged public var address2: String?
    @NSManaged public var city: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var state: String?
    @NSManaged public var zip: String?

}
