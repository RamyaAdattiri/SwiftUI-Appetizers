//
//  User.swift
//  Appetizers
//
//  Created by Ramya Adattiri on 2024-02-22.
//

import Foundation

struct User : Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthDate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
