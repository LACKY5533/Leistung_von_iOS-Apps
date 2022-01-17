//
//  Frienddd.swift
//  performance_IOS-Apps
//
//  Created by LACKY on 17.01.2022.
//

import Foundation

struct Frienddd {
    let id: Int
    let lastName: String
    let photo50: String
    let trackCode, firstName: String
    let photo100: String
    let deactivated: String?

    var fullName: String {
        firstName + " " + lastName
    }

}
