//
//  HomeViewController.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 11/16/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // background image
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "TitleScreen2")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        // custom colors for tab bar icons and labels
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor.orange
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for: UIControlState.normal)
        
       
    }
    @IBAction func mainIconClients(_ sender: UIButton) {
        
    }
    
    @IBAction func mainIconToDo(_ sender: UIButton) {
    }
    
    @IBAction func mainIconContacts(_ sender: UIButton) {
    }
    
    @IBAction func mainIconSchedule(_ sender: UIButton) {
    }
    
    @IBAction func goBack(_ sender: UIButton) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ClientsSegue" {
            if let destination = segue.destination as? UITabBarController {
                destination.selectedIndex = 3
            }
        }
        if segue.identifier == "ToDoSegue" {
            if let destination = segue.destination as? UITabBarController {
                destination.selectedIndex = 2
            }
          }
        if segue.identifier == "ScheduleSegue" {
            if let destination = segue.destination as? UITabBarController {
                destination.selectedIndex = 1
            }
        }
        if segue.identifier == "ContactsSegue" {
            if let destination = segue.destination as? UITabBarController {
                destination.selectedIndex = 0
            }
        }
    }
}

