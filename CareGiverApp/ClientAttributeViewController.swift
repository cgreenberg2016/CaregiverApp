//
//  ClientAttributeViewController.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 2/6/18.
//  Copyright © 2018 Carol Greenberg. All rights reserved.
//

import UIKit

class ClientAttributeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    var client: Client?
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var clientnamelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        clientnamelabel.text = client?.contact?.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clientAttributes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = clientAttributes[indexPath.row].title
        return cell

    }
    
    

}
