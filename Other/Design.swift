//
//  Design.swift
//  LinkAPI
//
//  Created by Sierra 4 on 30/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import Foundation
import UIKit
class Design
{
    class func makeCircular(_ sender: UIButton)
    {
        sender.layer.cornerRadius = sender.bounds.size.width * 0.5
        sender.clipsToBounds = true
    }
}
