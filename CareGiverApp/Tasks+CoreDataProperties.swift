//
//  Tasks+CoreDataProperties.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 12/11/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var title: String?

}
