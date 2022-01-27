//
//  GroupssInterface.swift
//  performance_IOS-Apps
//
//  Created by LACKY on 27.01.2022.
//

import Foundation

protocol GroupsInterface {
    func getGroups(completion: @escaping ([Group])-> ())
}

class GroupsProxy: GroupsInterface {
    
    let groupsService: GroupAdapter
    
    init(groupsService: GroupAdapter) {
        self.groupsService = groupsService
    }
    
    func getGroups(completion: @escaping ([Group]) -> ()) {
        self.getGroups(completion: completion)
    }
}
