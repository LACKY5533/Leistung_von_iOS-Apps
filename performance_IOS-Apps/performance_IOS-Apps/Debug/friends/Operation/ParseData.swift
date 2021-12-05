//
//  ParseData.swift
//  performance_IOS-Apps
//
//  Created by LACKY on 05.12.2021.
//

import Foundation
import SwiftyJSON

class ParseData: Operation {
    var friends: [Friend]? = []

    override func main() {
        guard let friendsData = dependencies.first as? GetDataFromURL,
              let data = friendsData.outputData else { return }

        do {
            let itemsData = try JSON(data)["response"]["items"].rawData()
            self.friends = try JSONDecoder().decode([Friend].self, from: itemsData)

        } catch {
            debugPrint(error)
        }

        debugPrint("pars")

    }

}
