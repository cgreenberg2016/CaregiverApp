//
//  ToDoViewController.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 11/20/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController {
    @IBOutlet weak var txtOutput: UITextView!
    @IBOutlet weak var txtInput: UITextField!
    
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addItem(_ sender: Any) {
        if (txtInput.text! == "") {
            return
        }
        items.append(txtInput.text!)
        txtOutput.text = ""
        for item in items {
            txtOutput.text.append("\(item)\n")
        }
        txtInput.text = ""
        txtInput.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
