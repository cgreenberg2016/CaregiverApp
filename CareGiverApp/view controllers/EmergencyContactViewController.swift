//
//  EmergencyContactViewController.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 2/27/18.
//  Copyright © 2018 Carol Greenberg. All rights reserved.
//

import UIKit

class EmergencyContactViewController: UIViewController {
    var client: Client?
    
    @IBOutlet weak var physicianName: UITextField!
    @IBOutlet weak var physicianPhone: UITextField!
    @IBOutlet weak var family1Name: UITextField!
    @IBOutlet weak var family1Phone: UITextField!
    
    @IBAction func Done(_ sender: UIBarButtonItem) {
        if let emergency = client?.emergency {
            emergency.physician = physicianName.text
            
            }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if client?.emergency == nil {
            let context =  (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
            client?.emergency = Emergency(context: context)
            
        }
        physicianName.text = client?.emergency?.physician
    }
}
