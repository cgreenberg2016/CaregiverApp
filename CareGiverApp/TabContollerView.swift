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
       
        
      //  let tabBarItemApperance = UITabBarItem.appearance()
       // tabBarItemApperance.setTitleTextAttributes[UIColor.red]; for: UIControlState.normal)
     //   tabBarItemApperance.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.red], for: UIControlState.normal)
        
     //   self.setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor:UIColor.red], for: UIControlState.selected)
    }
}
