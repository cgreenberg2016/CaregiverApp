//
//  ViewController.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 11/16/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // background image
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "TitleScreen2")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

