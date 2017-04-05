//
//  UserDetails.swift
//  LinkAPI
//
//  Created by Sierra 4 on 30/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import Foundation
import ObjectMapper

class UserDetails: Mappable
{
    var emailAddress: String?
    var firstName: String?
    var lastName: String?
    var id: String?
    var pictureUrl : String?
    var positions : Positions?
    var location : Location?
    required init?(map: Map){
        emailAddress <- map["emailAddress"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        id <- map["id"]
        pictureUrl <- map["pictureUrl"]
        positions <- map["positions"]
        location <- map["location"]
    }
    func mapping(map: Map){
        emailAddress <- map["emailAddress"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        id <- map["id"]
        pictureUrl <- map["pictureUrl"]
        positions <- map["positions"]
        location <- map["location"]
        
    }
}
class Location : Mappable
{
    var name : String?
    
    required init?(map: Map){
        name <- map["name"]
    }
    func mapping(map: Map){
        name <- map["name"]
        
    }
    
}
class Positions : Mappable
{
    var values : [Values]?
    required init?(map: Map){
    values <- map["values"]
    }
    func mapping(map: Map){
    values <- map["values"]
    }
    
}
class Values : Mappable
{
    var title : String?
    required init?(map: Map){
        title <- map["title"]
    }
    func mapping(map: Map){
        title <- map["title"]
        
    }
    
}


