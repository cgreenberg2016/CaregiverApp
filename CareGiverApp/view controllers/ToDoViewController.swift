//
//  ToDoViewController.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 11/20/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//

import UIKit
import CoreData

class ToDoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableResults: UITableView!
    
    var tasks : [Tasks] = []

    @IBOutlet weak var txtInput: UITextField!
     var appDelegate = UIApplication.shared.delegate as! AppDelegate
     let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
    
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableResults?.delegate = self
        TableResults?.dataSource = self as? UITableViewDataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //get data from core data
        getData()
        // reload the table view
        TableResults?.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        if task.completed {
           // cell.accessoryType = .checkmark
            cell.imageView?.image = UIImage(named: "checkedbox4")
        } else {
           // cell.accessoryType = .none
            cell.imageView?.image = UIImage(named: "uncheckedbox")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let task = tasks[indexPath.row]
        task.completed = !task.completed
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        do {
            tasks = try context.fetch(Tasks.fetchRequest())
        }
        catch {
            print ("Fetching failed")
        }
        TableResults.reloadData()
    }
    
    // fetch data
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
        
        do {
            tasks = try context.fetch(Tasks.fetchRequest())
        }
        catch {
            print ("Fetching failed")
        }
    }
    
    // delete items in list
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
        
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                tasks = try context.fetch(Tasks.fetchRequest())
            }
            catch {
                print ("Fetching failed")
            }
        }
        tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addItem(_ sender: UIButton) {
       let context = (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
       let task = Tasks(context: context)
        task.title = txtInput.text

         (UIApplication.shared.delegate as! AppDelegate).saveContext()
        getData()
        TableResults.reloadData()
        txtInput.text = ""
        
      
    }
    
    
  //   MARK: - Navigation

   //  In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      //   Get the new view controller using segue.destinationViewController.
      //   Pass the selected object to the new view controller.
    }
    

}
