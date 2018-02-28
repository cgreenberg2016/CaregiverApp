//
//  Emergency+CoreDataProperties.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 2/27/18.
//  Copyright © 2018 Carol Greenberg. All rights reserved.
//
//

import Foundation
import CoreData


extension Emergency {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Emergency> {
        return NSFetchRequest<Emergency>(entityName: "Emergency")
    }

    @NSManaged public var family1: String?
    @NSManaged public var family1Phone: String?
    @NSManaged public var family2: String?
    @NSManaged public var family2Phone: String?
    @NSManaged public var other: String?
    @NSManaged public var otherPhone: String?
    @NSManaged public var physician: String?
    @NSManaged public var physicianPhone: String?
    @NSManaged public var contact: Contact?

}
