//
//  ClientsTableViewController.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 12/21/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//

import UIKit
import CoreData

class ClientsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ContactsViewControllerDelegate {
    
    var clients:[Client] = []
    
    @IBOutlet weak var clientTable: UITableView!
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext


    override func viewDidLoad() {
        super.viewDidLoad()
        clientTable?.delegate = self
        clientTable?.dataSource = self as UITableViewDataSource

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
       
    }
    override func viewWillAppear(_ animated: Bool) {
        //get data from core data
        getData()
        // reload the table view
        clientTable?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // fetch data
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
        
        do {
            clients = try context.fetch(Client.fetchRequest()) as! [Client]
        }
        catch {
            print ("Fetching failed")
        }
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clients.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let client = clients[indexPath.row]
        cell.textLabel?.text = client.contact?.name ?? "unknown"
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    func updateContact(_ contact: Contact) {
        getData()
        clientTable.reloadData()
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DisplayContact" {
            let indexPath = self.clientTable.indexPath(for: sender as! UITableViewCell)!
            let client = self.clients[indexPath.row]
            let destination = segue.destination as! ContactsViewController
            destination.contact = client.contact
            destination.delegate = self
        } else if segue.identifier == "addclient" {
            let context =  (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
            let contact = Contact(context: context)
            let client = Client(context: context)
            client.contact = contact
            let destination = segue.destination as! ContactsViewController
            destination.contact = client.contact
            destination.delegate = self
        }

    }

}
