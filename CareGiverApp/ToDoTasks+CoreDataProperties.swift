//
//  ToDoTasks+CoreDataProperties.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 12/9/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//
//

import Foundation
import CoreData


extension ToDoTasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoTasks> {
        return NSFetchRequest<ToDoTasks>(entityName: "ToDoTasks")
    }

    @NSManaged public var title: String?
    @NSManaged public var completed: Bool

}
