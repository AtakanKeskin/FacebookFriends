//
//  NetworkManager.swift
//  FacebookFriends
//
//  Created by macbook on 6.11.2021.
//

import Foundation
import Alamofire
import RealmSwift


final class NetworkManager
{
    static let shared = NetworkManager()
    var friends : Friends  = Friends(results: [])
    var isFriendsEmpty : Bool = true
    
    private init() {}
    
    struct Constants {
        static let randomUsersAPI = "https://randomuser.me/api/?results=20"
    }
    
    enum HTTPMethod: String {
            case get
            case put
            case post
            case delete
        }
    
    func getRandomUsersList(){
        
        let request = AF.request(Constants.randomUsersAPI,method: .get, parameters: .none, headers: .none, interceptor: .none)
        
        request.validate(statusCode: 200 ..< 299).responseJSON { AFdata in
            
            guard let listData = AFdata.data else {return}
            
            do{
                let friendsList = try JSONDecoder().decode(Friends.self
                                                           , from: listData)
                DispatchQueue.main.async {
                    self.friends = friendsList
                    self.isFriendsEmpty = false
                }

            }catch{
                print("Error Decoding == \(error)")
            }
            
        }
    }
    
    
}
