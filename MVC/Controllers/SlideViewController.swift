//
//  SlideViewController.swift
//  LinkAPI
//
//  Created by Sierra 4 on 29/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {
    var images = [String]()
    var titles = [String]()
    var des = [String]()
    override func viewDidLoad()
    {
        images = Resources.getImages()
        titles = Resources.getTitles()
        des = Resources.getDescription()
        super.viewDidLoad()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        let viewMenuBack : UIView = view
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            var frameMenu : CGRect = viewMenuBack.frame
            frameMenu.origin.x = 1 * UIScreen.main.bounds.size.width
            viewMenuBack.frame = frameMenu
            viewMenuBack.layoutIfNeeded()
            viewMenuBack.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            viewMenuBack.removeFromSuperview()
        })
        
    }
}


extension SlideViewController : UITableViewDelegate,UITableViewDataSource
{
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: Segue.slidecell.id, for: indexPath)as! TableViewSlideCell
        cell.imglogo.image = UIImage(named:images[indexPath.row])
        cell.lbltitle.text = titles[indexPath.row]
        cell.lbldes.text = des[indexPath.row]
        return cell
    }
}
