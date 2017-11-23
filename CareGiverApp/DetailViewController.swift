//
//  DetailViewController.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 11/21/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var address1Label: UITextField!
    @IBOutlet weak var address2Label: UITextField!
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var stateLabel: UITextField!
    @IBOutlet weak var zipcodeLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.delegate = self as? UITextFieldDelegate
        self.phoneLabel.delegate = self as? UITextFieldDelegate
        
        if let contact = self.contact {
            if let name = contact.name {
                self.nameLabel.text = name
            }
            if let phone = contact.phone {
                self.phoneLabel.text = phone
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
   

}
