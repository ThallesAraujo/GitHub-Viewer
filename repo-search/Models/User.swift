//
//  File.swift
//  swift-issues
//
//  Created by Thalles Araújo on 15/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import ObjectMapper

infix operator <-

class User: Mappable {
    
    var name: String = ""
    var profilePhoto: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        profilePhoto <- map["avatar_url"]
    }
    
    
    
}
