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


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var title: String?

}
