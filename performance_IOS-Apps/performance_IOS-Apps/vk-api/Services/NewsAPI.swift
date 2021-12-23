//
//  NewsAPI.swift
//  client-server-IOS-applications
//
//  Created by LACKY on 15.11.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

final class NewsAPI {

    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"

    func getNews(startTime: Double? = nil, startFrom: String? = "", completion: @escaping (Feed?) -> ()) {

        let method = "/newsfeed.get"

        let parameters: Parameters = [
            "user_id": userId,
            "filters": "post, photo",
            "count": 2,
            "access_token": token,
            "v": version,
            "start_time": startTime,
            "start_from": startFrom
        ]

        let url = baseUrl + method

        AF.request(url, method: .get, parameters: parameters).responseJSON  { response in
            
            guard let data = response.data else { return }
            //debugPrint(response.data?.prettyJSON as Any)
            
            let decoder = JSONDecoder()
            let json = JSON(data)
            let dispatchGroup = DispatchGroup()
            
            let vkNewsJSONArr = json["response"]["items"].arrayValue
            let vkProfilesJSONArr = json["response"]["profiles"].arrayValue
            let vkGroupsJSONArr = json["response"]["groups"].arrayValue
            let nextFrom = json["response"]["next_from"].stringValue
            
            var vkNewsArray: [News] = []
            var vkProfilesArray: [Profile] = []
            var vkGroupsArray: [GroupsNews] = []
            
            //News
            DispatchQueue.global().async(group: dispatchGroup) {
                
                for (index, items) in vkNewsJSONArr.enumerated() {
                    
                    do {

                        let decodedItem = try decoder.decode(News.self, from: items.rawData())
                        vkNewsArray.append(decodedItem)
                        
                    } catch (let errorDecode) {
                        print("index: \(index), error: \(errorDecode)")
                    }
                }
            }
            
            //Profiles
            DispatchQueue.global().async(group: dispatchGroup) {
                
                for (index, profiles) in vkProfilesJSONArr.enumerated() {
                    
                    do {

                        let decodedItem = try decoder.decode(Profile.self, from: profiles.rawData())
                        vkProfilesArray.append(decodedItem)
                        
                    } catch (let errorDecode) {
                        print("index: \(index), error: \(errorDecode)")
                    }
                }
            }
            
            //Groups
            DispatchQueue.global().async(group: dispatchGroup) {
                
                for (index, groups) in vkGroupsJSONArr.enumerated() {
                    
                    do {

                        let decodedItem = try decoder.decode(GroupsNews.self, from: groups.rawData())
                        vkGroupsArray.append(decodedItem)
                        
                    } catch (let errorDecode) {
                        print("index: \(index), error: \(errorDecode)")
                    }
                }
            }
            
            dispatchGroup.notify(queue: DispatchQueue.main) {
                let newsResponse = FeedResponse(items: vkNewsArray,
                                                groups: vkGroupsArray,
                                                profiles: vkProfilesArray,
                                                nextFrom: nextFrom)
                let feed = Feed(response: newsResponse)
                
                completion(feed)
            }
        }
    }
}
