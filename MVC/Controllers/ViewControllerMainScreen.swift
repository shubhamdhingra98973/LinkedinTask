//
//  ViewControllerMainScreen.swift
//  LinkAPI
//
//  Created by Sierra 4 on 29/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import UIKit
import  Kingfisher

class ViewControllerMainScreen: UIViewController {
    
    //outlet created
    @IBOutlet weak var btnprofile: UIButton!
    @IBOutlet weak var SlideMenu: UIButton!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var btnpost: UIButton!
    
    // Local variable created
    var firstName:String?
    var lastName:String?
    var url:String?
    var titles:String?
    var user:UserDetails?
    @IBOutlet weak var btnimage: UIButton!
    var ViewHeader:ViewHeader?
    override func viewDidLoad() {
        
        btnimage.kf.setImage(with: URL(string: url!), for: .normal)
        
        //To make circular
        Design.makeCircular(btnpost)
        Design.makeCircular(btnimage)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        super.viewDidLoad()
        
        //register nib ...Xib file registered.
        let nib1 = UINib(nibName: TableViewCellName.firstcell.id, bundle: nil)
        tableview.register(nib1, forCellReuseIdentifier: TableViewCellIdentifier.firstcell.id)
        let nib2 = UINib(nibName: TableViewCellName.secondcell.id, bundle: nil)
        tableview.register(nib2, forCellReuseIdentifier: TableViewCellIdentifier.secondcell.id)
        let nib3 = UINib(nibName: TableViewCellName.thirdcell.id, bundle: nil)
        tableview.register(nib3, forCellReuseIdentifier: TableViewCellIdentifier.thirdcell.id)
        ViewHeader = UINib(nibName:headerName.header.id,bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? ViewHeader
    }
   
    @IBAction func btnSlideAct(_ sender: Any) {
        
        SlideMenu.isEnabled = false
        menuappers(){_ in
            self.SlideMenu.isEnabled = true
        }
    }
    
    // Mark: -  func to drag tableview left side
    
    func menuappers(completionHandler:@escaping() -> ())
    {
        let menuVC : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: Segue.SideScreenViewController.id)
        
        self.view.addSubview(menuVC.view)
        self.addChildViewController(menuVC)
        
        menuVC.view.layoutIfNeeded()
        
        menuVC.view.frame=CGRect(x: 0 + UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            
            
        }, completion:{completed in
            if completed {
                completionHandler()
            }
        })
        
    }
    // MARK: - YES I AM 
    
    // MARK: - to show Profile

    
    @IBAction func btnShowProfile(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: Segue.DataPass.id, sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == Segue.PostAction.id){
            if let destinationViewController=segue.destination as? PostViewController{
                destinationViewController.userDetails = self.user
            }
        }
        else
            if(segue.identifier == Segue.DataPass.id){
                if let destinationViewController=segue.destination as? ViewControllerProfile{
                    destinationViewController.userDetails = self.user
                }
        }
    }
    @IBAction func btnPostAct(_ sender: Any) {
        
        self.performSegue(withIdentifier: Segue.PostAction.id, sender: self)
        
        
    }
    
}
extension ViewControllerMainScreen : UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let firstcell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.firstcell.id, for: indexPath) as! TableViewFirstCell
        
        firstcell.lblfirstName.text = firstName! + Utilities.space.id + lastName!
        firstcell.imgprofile.kf.setImage(with:  URL(string: url!))
        firstcell.btnlike.tintColor = UIColor.gray
        firstcell.lbltitle.text = titles
        
        
        return firstcell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 294
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ViewHeader
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0
        {
            return 40
        }
        else
        {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                menuappers(){_ in
                    
                }
                
            default:
                break
            }
        }
    }
    
}

//Mark : - extension Scroll delegate

extension ViewControllerMainScreen
{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        tableview.reloadData()
        btnpost.isHidden = true
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        btnpost.isHidden = false
    }
    
}





