//
//  PresentFriends.swift
//  performance_IOS-Apps
//
//  Created by LACKY on 05.12.2021.
//

import Foundation
import UIKit

class PresentFriends: Operation {
    var controllerToPresent: FriendsVKViewController
    
    private let friendDB = FriendDB()
    
    override func main() {
        guard let parsedData = dependencies.first as? ParseData,
        let friends = parsedData.friends else { return }

        let friendsOld = self.friendDB.load()
        friendsOld.forEach {
            friendDB.delete($0)
        }
        
        self.friendDB.save(friends)
        controllerToPresent.friends = self.friendDB.load()
        
        controllerToPresent.tableView.reloadData()

        debugPrint("Presenting done")
    }

    init(controller: FriendsVKViewController) {
        self.controllerToPresent = controller
    }


}
