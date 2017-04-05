//
//  Resources.swift
//  LinkAPI
//
//  Created by Sierra 4 on 30/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import Foundation
import UIKit
class Resources
{
    class func getImages() -> [String]
    {
        let images:[String]  = ["jobsearch.jpeg","learning.jpeg","lookup.jpeg","slideshare.jpeg"]
        return images
    }
    class func getTitles() -> [String]
    {
        let titles:[String]  = ["Job Search","Linkedin Learning","Look Up","Slideshare"]
        return titles
    }
    class func getDescription() -> [String]
    {
        let description:[String]  = ["Find a job you have ","Gain new Skills","Find your coworkers","Master new topics"]
        return description
    }
}
