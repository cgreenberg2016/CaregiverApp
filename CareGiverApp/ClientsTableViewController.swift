//
//  ClientsTableViewController.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 11/21/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//

import UIKit

class ClientsTableViewController: UITableViewController {

    var contacts:[Contact] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
      /*  let moveButton = UIBarButtonItem(barButtonSystemItem: .edit,  target: self, action: #selector(ClientsTableViewController.toggleEdit))
        navigationItem.leftBarButtonItem = moveButton
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ClientsTableViewController.addContact))
        navigationItem.rightBarButtonItem = addButton */
        
        let jenny = Contact(phone: "867-5309")
        let rich = Contact(name: "Rich", phone: "888-888-8888")
        let jane = Contact(name: "Jane")
        let carol = Contact(name: "Carol Greenberg", phone: "808-769-2532", address1: "130 Bennett Ave.", city: "Long Beach", zipcode: "90803", state:"California", email: "carolg.com@gmail.com")
        
        self.contacts.append(jenny)
        self.contacts.append(rich)
        self.contacts.append(jane)
        self.contacts.append(carol)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @objc func toggleEdit() {
        tableView.setEditing(!tableView.isEditing, animated: true)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ClientsTableViewController.doneEdit))
        navigationItem.leftBarButtonItem = doneButton
    }
    @objc func doneEdit() {
        tableView.setEditing(false, animated: true)
        let moveButton = UIBarButtonItem(barButtonSystemItem: .edit,  target: self, action: #selector(ClientsTableViewController.toggleEdit))
        navigationItem.leftBarButtonItem = moveButton
    }
    
    @objc func addContact() {
        let newContact = Contact(name: "Enter New Contact", phone: "Enter New Phone Number")
        self.contacts.append(newContact)
        let newIndexPath = IndexPath(row: self.contacts.count - 1, section: 0)
        self.tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let contact = self.contacts[indexPath.row]
        
        if let name = contact.name {
            cell.textLabel?.text = name
        } else {
            cell.textLabel?.text = "No Name"
        }
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    

   
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)!
        let contact = self.contacts[indexPath.row]
        let destination = segue.destination as! DetailViewController
        destination.contact = contact
    }
    

}
