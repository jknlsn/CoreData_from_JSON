//
//  TransferUser.swift
//  CoreData_from_JSON
//
//  Created by Jake Nelson on 3/11/19.
//  Copyright © 2019 Jake Nelson. All rights reserved.
//

import Foundation

struct TransferUser: Hashable, Codable, Identifiable {
    var id: Int
    var first_name: String
    var last_name: String
    var email: String
    var gender: String
    var ip_address: String
    
}
