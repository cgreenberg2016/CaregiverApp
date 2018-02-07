//
//  ClientAttribute.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 2/6/18.
//  Copyright © 2018 Carol Greenberg. All rights reserved.
//

import Foundation
let clientAttributes: [ClientAttribute] =
    [ClientAttribute ("Appointments"),ClientAttribute("Medications"), ClientAttribute("Trackers"), ClientAttribute("MedicalCond"), ClientAttribute("Emergency"), ClientAttribute("PersonalInfo")]
class ClientAttribute {
    let title: String;
    init (_ title:String) {
        self.title = title
    }
    
}
