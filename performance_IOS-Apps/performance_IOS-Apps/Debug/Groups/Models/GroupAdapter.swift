//
//  FriendAdapter.swift
//  performance_IOS-Apps
//
//  Created by LACKY on 17.01.2022.
//

import Foundation
import Alamofire

class GroupAdapter: GroupsAPIprotocol{

    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    
    private let groups: GroupDB
    
    init(adaptee: GroupDB) {
        self.groups = adaptee
    }
    
    func getGroups(completion: @escaping ([Group])->()) {
        let method = "groups.get"
        
        let parameters: Parameters  = [
            "user_id": userId ,
            "access_token": token,
            "v": version,
            "extended": 1
        ]
        
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
//            if let error = response.error {resolver.reject(error)}
            if let data = response.data {
                do {
                    
                    let groupsJSON = try JSONDecoder().decode([Group].self, from: data)
//                    resolver.fulfill(groupsJSON)
                    //let groups = groupsJSON.response.items
                } catch {
                    print(error)
                }
            }
        }
        groups.load()
    }        
}
