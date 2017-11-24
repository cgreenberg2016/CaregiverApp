//
//  Contact.swift
//  CareGiverApp
//
//  Created by Carol Greenberg on 11/21/17.
//  Copyright © 2017 Carol Greenberg. All rights reserved.
//

import UIKit

class Contact: NSObject {
    var name : String?
    var phone : String?
    var address1 : String?
    var address2 : String?
    var city : String?
    var zipcode : String?
    var state : String?
    var email : String?

    init(name: String? = nil, phone: String? = nil, address1: String? = nil, address2: String? = nil, city: String? = nil, zipcode: String? = nil, state: String? = nil, email: String? = nil) {
    self.name = name
    self.phone = phone
    self.address1 = address1
    self.address2 = address2
    self.city = city
    self.zipcode = zipcode
    self.state = state
    self.email = email
    super.init()
    }
}
