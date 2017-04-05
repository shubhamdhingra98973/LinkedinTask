//
//  ViewHeaderProfile.swift
//  LinkedIn
//
//  Created by Sierra 4 on 30/03/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class ViewHeaderProfile: UIView {
/*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func backBtn(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Segue.Back.id), object: nil)
    }

}
