//
//  TabContollerView.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 11/30/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//

import UIKit

class TabControllerView: UITabBarItem {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
        
    }
    override init() {
        super.init()
        commonInit()
    }
    
    func commonInit() {
       
    }
}
