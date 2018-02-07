//
//  ClientAttribute.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 2/6/18.
//  Copyright © 2018 Carol Greenberg. All rights reserved.
//

import Foundation
let clientAttributes: [ClientAttribute] =
    [ClientAttribute ("Appointments"),ClientAttribute("Medications"), ClientAttribute("Trackers"), ClientAttribute("Medical Condition"), ClientAttribute("Emergency Contact"), ClientAttribute("Personal Information")]
class ClientAttribute {
    let title: String;
    init (_ title:String) {
        self.title = title
    }
    
}
