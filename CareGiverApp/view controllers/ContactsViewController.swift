//
//  ContactsViewController.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 11/21/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//

import UIKit
import CoreData

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet weak var AddressView: UIView!
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var address1Label: UITextField!
    @IBOutlet weak var address2Label: UITextField!
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var stateLabel: UITextField!
    @IBOutlet weak var zipcodeLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    var contact: ContactsEntity?
    
    @IBAction func DoneButton(_ sender: UIBarButtonItem) {
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
        if let contact = contact {
            contact.contactName = nameLabel.text
            contact.contactPhone = phoneLabel.text
            contact.contactAddress1 = address1Label.text
            contact.contactAddress2 = address2Label.text
            contact.contactCity = cityLabel.text
            contact.contactState = stateLabel.text
            contact.contactZip = zipcodeLabel.text
            contact.contactEmail = emailLabel.text
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
        if contact == nil {
            let context =  (UIApplication.shared.delegate as! AppDelegate).persistantContainer.viewContext
            contact = ContactsEntity(context: context)
            
            
            
        }
        
        
        
        self.nameLabel.delegate = self as? UITextFieldDelegate
        self.phoneLabel.delegate = self as? UITextFieldDelegate
        self.address1Label.delegate = self as? UITextFieldDelegate
        self.address2Label.delegate = self as? UITextFieldDelegate
        self.cityLabel.delegate = self as? UITextFieldDelegate
        self.stateLabel.delegate = self as? UITextFieldDelegate
        self.zipcodeLabel.delegate = self as? UITextFieldDelegate
        self.emailLabel.delegate = self as? UITextFieldDelegate
        
        if let contact = self.contact {
            if let name = contact.contactName {
                self.nameLabel.text = name
            }
            if let phone = contact.contactPhone {
                self.phoneLabel.text = phone
            }
            if let address1 = contact.contactAddress1 {
                self.address1Label.text = address1
            }
            if let address2 = contact.contactAddress2 {
                self.address2Label.text = address2
            }
            if let city = contact.contactCity {
                self.cityLabel.text = city
            }
            if let state = contact.contactState {
                self.stateLabel.text = state
            }
            if let zipcode = contact.contactZip {
                self.zipcodeLabel.text = zipcode
            }
            if let email = contact.contactEmail {
                self.emailLabel.text = email
            }
            
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == Notification.Name.UIKeyboardWillHide {
            ScrollView.contentInset = UIEdgeInsets.zero
        } else {
            ScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        
        ScrollView.scrollIndicatorInsets = ScrollView.contentInset
        
        //  let selectedRange = ScrollView.selectedRange
        //  ScrollView.scrollRangeToVisible(selectedRange)
    }
    
}




