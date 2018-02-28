//
//  Client+CoreDataProperties.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 2/27/18.
//  Copyright © 2018 Carol Greenberg. All rights reserved.
//
//

import Foundation
import CoreData


extension Client {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Client> {
        return NSFetchRequest<Client>(entityName: "Client")
    }

    @NSManaged public var contact: Contact?
    @NSManaged public var emergency: Emergency?

}
