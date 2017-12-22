//
//  ClientsTableView.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 12/6/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//

import UIKit
import CoreData

class clientsTableView: UIViewController {
    
    @IBOutlet weak var clientTable: UITableView!
    
    var clients:[ContactsEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
            print("viewDidLoad happened")
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        //get data from core data
        getData()
        // reload the table view
        clientTable?.reloadData()
        print("viewWillAppear happened")
        
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return clients.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let client = clients[indexPath.row]
        cell.textLabel?.text = client.contactName
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // Override to support conditional editing of the table view.
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    // fetch data
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
        
        do {
            clients = try context.fetch(ContactsEntity.fetchRequest()) as! [ContactsEntity]
        }
        catch {
            print ("Fetching failed")
        }
    }
}
