//
//  enums.swift
//  LinkAPI
//
//  Created by Sierra 4 on 29/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import Foundation
import UIKit

enum headerName : String
{
    case header = "ViewHeader"
    var id : String{
        return self.rawValue
    }
}

enum Error : String
{
    case error_msg = "There is some error"
    var id : String{
        return self.rawValue
    }
}
enum Utilities : String
{
    case space = " "
    case default_value = "nil"
    case bg_image = "bg_3.png" 
    var id : String{
        return self.rawValue
    }
}
enum TableViewCellName : String
{
    case firstcell = "TableViewFirstCell"
    case secondcell = "TableViewSecondCell"
    case thirdcell = "TableViewThirdCell"
    case ViewHeaderProfile = "ViewHeaderProfile"
    case  tableviewcellprofile = "TableViewCellProfile"
    var id : String{
        return self.rawValue
    }
}
enum TableViewCellIdentifier : String
{
    case firstcell = "firstcell"
    case secondcell = "secondcell"
    case thirdcell = "thirdcell"
    var id : String
        {
            return self.rawValue
    }
}

enum Linkedin : String
{
    case url = "https://api.linkedin.com/v1/people/~:(id,first-name,last-name,email-address,picture-url,picture-urls::(original),positions,date-of-birth,phone-numbers,location)?format=json"
    case clientId = "812ufqwffyhx2b"
    case clientSecret = "E6HLbn6cVFkfALvM"
    case state = "987654321"
    case redirectUrl = "https://www.example.com/auth/linkapp"
    
    var id : String
        {
            return self.rawValue
    }
}
enum LinkedinStatus : String
{
    case success = "Login success lsToken"
    case cancelled = "User cancelled"
    case error = "Error"
    case fail = "fail"
    var id : String
        {
            return self.rawValue
    }
}
enum LinkedinPermissions : String
{
    case basicProfile = "r_basicprofile"
    case emailAddress = "r_emailaddress"
    
    var id : String
    {
        return self.rawValue
    }
}

enum Segue: String
{
    case mainview = "mainview"
    case DataPass = "DataPass"
    case PostAction = "postAction"
    case slidecell = "slidecell"
    case SideScreenViewController = "sideScreenViewController"
    case Profile = "Profile"
    case Back = "btnBack"
    var id : String
        {
            return self.rawValue
    }
}
