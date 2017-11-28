//
//  DetailViewController.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 11/21/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//

import UIKit

class ClientsViewController: UIViewController {

    @IBOutlet weak var ScrollView: UIScrollView!
    
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
        self.address1Label.delegate = self as? UITextFieldDelegate
        self.address2Label.delegate = self as? UITextFieldDelegate
        self.cityLabel.delegate = self as? UITextFieldDelegate
        self.stateLabel.delegate = self as? UITextFieldDelegate
        self.zipcodeLabel.delegate = self as? UITextFieldDelegate
        self.emailLabel.delegate = self as? UITextFieldDelegate
        
        if let contact = self.contact {
            if let name = contact.name {
                self.nameLabel.text = name
            }
            if let phone = contact.phone {
                self.phoneLabel.text = phone
            }
            if let address1 = contact.address1 {
                self.address1Label.text = address1
            }
            if let address2 = contact.address2 {
                self.address2Label.text = address2
            }
            if let city = contact.city {
                self.cityLabel.text = city
            }
            if let state = contact.state {
                self.stateLabel.text = state
            }
            if let zipcode = contact.zipcode {
                self.zipcodeLabel.text = zipcode
            }
            if let email = contact.email {
                self.emailLabel.text = email
            }
            
            let notificationCenter = NotificationCenter.default
            notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillHide, object: nil)
            notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
           
            
            
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ClientsViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
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
            ScrollView?.contentInset = UIEdgeInsets.zero
        } else {
            ScrollView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
    }
    
    
    
   

}
