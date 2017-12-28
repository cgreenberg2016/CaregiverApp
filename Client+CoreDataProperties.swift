//
//  Client+CoreDataProperties.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 12/26/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//
//

import Foundation
import CoreData


extension Client {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Client> {
        return NSFetchRequest<Client>(entityName: "Client")
    }

    @NSManaged public var name: String?
    @NSManaged public var contact: Contact?

}
