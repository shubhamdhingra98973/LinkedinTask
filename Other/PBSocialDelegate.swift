//
//  PBSocialDelegate.swift
//  LinkAPI
//
//  Created by Sierra 4 on 04/04/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import Foundation
protocol PBSocialDelegate {
    //MARK: LinkedIn
    func getLinkedinResponse(userData : [String : AnyObject])
    
}

var pbSocialDelegate : PBSocialDelegate!
