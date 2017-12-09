//
//  AppDelegate.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 11/16/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // create container
    var persistantContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoTasks")
        container.loadPersistentStores(completionHandler: {
            (storeDescription, error) in
            print(storeDescription)
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        } )
        return container
    }()
    // save managed objects
    func saveContext() {
        let context = persistantContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            }catch {
                let err = error as NSError
                fatalError("Unresolved error \(error), \(err.userInfo)")
            }
        }
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // status bar color
        UIApplication.shared.statusBarStyle = .lightContent
        UINavigationBar.appearance().clipsToBounds = true
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.backgroundColor = UIColor(red: 16/255, green:175/255, blue:216/255, alpha:1.0)
        return true
    }

    
    



}

