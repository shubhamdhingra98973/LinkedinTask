//
//  TableViewSlideCell.swift
//  LinkAPI
//
//  Created by Sierra 4 on 29/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import UIKit

class TableViewSlideCell: UITableViewCell {

    @IBOutlet weak var imglogo: UIImageView!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var lbldes: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
