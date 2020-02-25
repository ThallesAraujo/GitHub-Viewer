//
//  RepoService.swift
//
//  Created by Thalles Araújo on 15/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import Foundation
import Alamofire
import ObjectMapper

class RepoService{
    
    class func getUser(username: String, success: @escaping (_ user: User) -> Void, failure: @escaping (_ error: String) -> Void){
        
        Network.request(url: APIHelper.USER.getURL([String.init(format: "%@", username)]), method: .get, completion: { (response) in
            StatusCodeHelper.handleResponse(response: response, success: {
                guard let json = response.result.value as? [String:Any] else{
                    failure("Invalid JSON")
                    return
                }
                let user = Mapper<User>().map(JSON: json)
                success(user!)
            }, error: {error in
                failure(error)
            })
        }, noNetworkCompletion: failure)
    }
    
    
    class func getRepos(username: String, success: @escaping (_ repos: [Repo]) -> Void, failure: @escaping (_ error: String) -> Void){
        
        Network.request(url: APIHelper.REPOS.getURL([String.init(format: "%@", username)]), method: .get, completion: { (response) in
            StatusCodeHelper.handleResponse(response: response, success: {
                guard let json = response.result.value as? [[String:Any]] else{
                    failure("Invalid JSON")
                    return
                }
                let repos = Mapper<Repo>().mapArray(JSONArray: json)
                success(repos)
            }, error: {error in
                failure(error)
            })
            
        }, noNetworkCompletion: failure)
    }
    
    
    
}
