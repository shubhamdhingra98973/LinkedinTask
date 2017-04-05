//
//  ViewControllerProfile.swift
//  LinkedIn
//
//  Created by Sierra 4 on 30/03/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit
import Kingfisher

class ViewControllerProfile: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var userDetails :UserDetails?
    //var view =  ViewControllerMainScreen()
    @IBOutlet var TableView: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
      return   1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.row){
        case 0:
        let nib = UINib(nibName: TableViewCellName.tableviewcellprofile.id, bundle: nil)
        TableView.register(nib, forCellReuseIdentifier: Segue.Profile.id )
        let cell = tableView.dequeueReusableCell(withIdentifier:Segue.Profile.id, for: indexPath) as! TableViewCellProfile
        cell.prfImg.kf.setImage(with: URL(string: userDetails?.pictureUrl ?? Utilities.space.id))
        cell.lblName.text = (userDetails?.firstName ?? Utilities.space.id)+Utilities.space.id+(userDetails?.lastName ?? Utilities.space.id)
        return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.firstcell.id, for: indexPath) as! TableViewCellProfileVisit
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.secondcell.id, for: indexPath) as! TableViewCellActivity
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.secondcell.id, for: indexPath) as! TableViewCellActivity
            cell.btnEdit.isHidden = true
            return cell
        default:
            return UITableViewCell()
            
    }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let nib = UINib(nibName: TableViewCellName.ViewHeaderProfile.id, bundle: nil)
        let View = nib.instantiate(withOwner: nil, options: nil)[0] as? ViewHeaderProfile
        return View
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.row)
        {
        case 0:
           return 230
        case 1:
            return 150
        case 2:
            return 170
        default:
            return 180
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: Segue.Back.id), object: nil, queue: nil) { (notification) in
            _ =  self.navigationController?.popViewController(animated: true)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }    
}
