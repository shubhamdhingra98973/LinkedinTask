//
//  TableViewFirstCell.swift
//  LinkAPI
//
//  Created by Sierra 4 on 29/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import UIKit

class TableViewFirstCell: UITableViewCell {
    @IBOutlet weak var lbltitle: UILabel!

    @IBOutlet weak var lblfirstName: UILabel!
    @IBOutlet weak var imgprofile: UIImageView!
    var tapCount:Int = 0
    @IBOutlet weak var btnlike: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgprofile.layer.cornerRadius = 0.5 * imgprofile.bounds.size.width
        imgprofile.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnlikeact(_ sender: UIButton) {
        
        sender.addTarget(self, action: #selector(self.holdDown(sender:)), for: UIControlEvents.touchUpInside)
        sender.addTarget(self, action: #selector(self.holdRelease(sender:)), for: UIControlEvents.touchDown)
        
    }
    
    //target functions
    func holdDown(sender:UIButton)
    {
        sender.tintColor = UIColor.blue
    }
    
    func holdRelease(sender:UIButton)
    {
        sender.tintColor = UIColor.gray
    }
}
