//
//  ContactsTableViewController.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 11/21/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//

import UIKit
import CoreData

class ContactsTableViewController: UITableViewController {
    
    
    @IBOutlet var TableContainer: UITableView!
    
    var contacts:[ContactsEntity] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        TableContainer?.delegate = self
        TableContainer?.dataSource = self as UITableViewDataSource
        print("viewDidLoad happened")
        
        
        /*  let moveButton = UIBarButtonItem(barButtonSystemItem: .edit,  target: self, action: #selector(ClientsTableViewController.toggleEdit))
         navigationItem.leftBarButtonItem = moveButton*/
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        //get data from core data
        getData()
        // reload the table view
        TableContainer?.reloadData()
        print("viewWillAppear happened")
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return contacts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.contactName
        return cell
    }
    // fetch data
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
        
        do {
            contacts = try context.fetch(ContactsEntity.fetchRequest()) as! [ContactsEntity]
        }
        catch {
            print ("Fetching failed")
        }
    }
    
    // manually show segue
    /*   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let contact = self.contacts[indexPath.row]
     if
     let destination = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ContactsViewController") as? ContactsViewController {
     destination.contact = contact
     self.navigationController?.pushViewController(destination, animated: true)
     }
     } */
    
    
    
    // delete items in list
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
        
        if editingStyle == .delete {
            let contact = contacts[indexPath.row]
            context.delete(contact)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            getData()
            tableView.reloadData()
        }
    }
    
    @objc func toggleEdit() {
        tableView.setEditing(!tableView.isEditing, animated: true)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ContactsTableViewController.doneEdit))
        navigationItem.leftBarButtonItem = doneButton
    }
    @objc func doneEdit() {
        tableView.setEditing(false, animated: true)
        let moveButton = UIBarButtonItem(barButtonSystemItem: .edit,  target: self, action: #selector(ContactsTableViewController.toggleEdit))
        navigationItem.leftBarButtonItem = moveButton
    }
    
    @objc func addContact() {
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
        // the add button should go to the next screen. when the user inputs all the information, there should be a save button that goes back to the contact list screen that shows the contact
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //        let newContact = Contact(name: "Enter New Contact", phone: "Enter New Phone Number")
        //        self.contacts.append(newContact)
        //        let newIndexPath = IndexPath(row: self.contacts.count - 1, section: 0)
        //        self.tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    
    // Override to support editing the table view.
    //  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //     if editingStyle == .delete {
    // Delete the row from the data source
    //        tableView.deleteRows(at: [indexPath], with: .fade)
    //     } else if editingStyle == .insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    //    }
    //  }
    
    
    
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
        if segue.identifier == "DisplayContact" {
            let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)!
            let contact = self.contacts[indexPath.row]
            let destination = segue.destination as! ContactsViewController
            destination.contact = contact
        }
        
    }
}
        

    


