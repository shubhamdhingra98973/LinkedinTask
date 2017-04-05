//
//  TableViewCellProfile.swift
//  LinkedIn
//
//  Created by Sierra 4 on 30/03/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit

class TableViewCellProfile: UITableViewCell {


    @IBOutlet weak var prfImg: UIImageView!
    @IBOutlet var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        prfImg.layer.cornerRadius = 50
        prfImg.layer.borderWidth = 4
       prfImg.layer.borderColor = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
