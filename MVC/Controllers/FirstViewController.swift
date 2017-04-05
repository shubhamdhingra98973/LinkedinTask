//
//  FirstViewController.swift
//  LinkAPI
//
//  Created by Sierra 4 on 30/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import UIKit
import  LinkedinSwift
import ObjectMapper
import Kingfisher
import SwiftyJSON



class FirstViewController: UIViewController {
    
    //local variable declared
    var shareurl : String = "https://api.linkedin.com/v1/people/~/shares??oauth2_access_token=ACCESS_TOKEN&format=json"
    var payload : String = "{\"comment\":\"Check out developer.linkedin.com!\",\"content\":{\"title\":\"LinkedIn Developers Resources\",\"description\":\"Leverage LinkedIn's APIs to maximize engagement\",\"submitted-url\":\"https://developer.linkedin.com\",\"submitted-image-url\":\"https://brand.linkedin.com/etc/designs/linkedin/katy/global/clientlibs/img/default-share.png\"},\"visibility\":{ \"code\":\"anyone\" }}"
    static var  pictureurl:String?
    

    override func viewDidLoad() {
        btnSignIn.layer.cornerRadius = 15
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: Utilities.bg_image.id)!)
        
    }
    
    @IBOutlet weak var btnSignIn: UIButton!
    var userdetails : UserDetails?
    let linkedinHelper = LinkedinSwiftHelper(configuration: LinkedinSwiftConfiguration(clientId: Linkedin.clientId.id,
                                                                                       clientSecret: Linkedin.clientSecret.id,
                                                                                       state: Linkedin.state.id,
                                                                                       permissions: [LinkedinPermissions.basicProfile.id, LinkedinPermissions.emailAddress.id],
                                                                                       redirectUrl: Linkedin.redirectUrl.id))
    
    
    @IBAction func requestact(_ sender: UIButton) {
        let url = NSString(string:"https://api.linkedin.com/v1/people/~:(id,industry,firstName,lastName,emailAddress,headline,summary,publicProfileUrl,specialties,positions:(id,title,summary,start-date,end-date,is-current,company:(id,name,type,size,industry,ticker)),pictureUrls::(original),location:(name))?format=json")
        
        //let permissions: [AnyObject] =
        
        LISDKSessionManager.createSession(withAuth: [LISDK_BASIC_PROFILE_PERMISSION,LISDK_EMAILADDRESS_PERMISSION], state: nil, showGoToAppStoreDialog: true, successBlock: { (success) -> () in
            if LISDKSessionManager.hasValidSession() {
                LISDKAPIHelper.sharedInstance().getRequest(url as String, success: {
                    response in
                    print(response ?? "nil")
                    print("successfully signed in")
                    
                
                    DispatchQueue.main.async(execute: { () -> () in
                        
                        if let dataFromString = response?.data.data(using: String.Encoding.utf8, allowLossyConversion: false) {
                            let result = JSON(data: dataFromString)
                            
                            
                            LISDKSessionManager.clearSession()
                            
                            //Do something with the response for example
                            var picURL: String!
                            
                            for stringInArray in result["pictureUrls"]["values"]{
                                
                                let value = stringInArray.1.stringValue
                                print(value)
                                picURL = value
                            }
                            print(result["pictureUrls"]["values"].arrayValue)
                            print(result["specialties"].stringValue)
                            
                            
                        }
                        
                        
                    })
                    
                }, error: {
                    error in
                    
                    LISDKAPIHelper.sharedInstance().cancelCalls()
                    LISDKSessionManager.clearSession()
                    
                    print(error?.localizedDescription ?? "nil")
                    //Do something with the error
                })
            }
            
            
            print("success called!")
            
            
        }, errorBlock: { (error) -> () in
            print("%s", "error called!")
            
            LISDKAPIHelper.sharedInstance().cancelCalls()
            LISDKSessionManager.clearSession()
        })
        

    }

    @IBAction func btnAct(_ sender: Any) {
        linkedinHelper.authorizeSuccess({(lsToken)  ->  Void in
            print(LinkedinStatus.success.id)
            self.requestForDetails()
            
        }, error: {  (error) -> Void in
            print(LinkedinStatus.error.id)
        }, cancel: { () -> Void in
            print(LinkedinStatus.cancelled.id)
        })
    }
    
    func requestForDetails()
    {
        linkedinHelper.requestURL(Linkedin.url.id,requestType: LinkedinSwiftRequestGet, success: { (response) -> Void in
            print(response)
            self.userdetails  = Mapper<UserDetails>().map(JSONObject: response.jsonObject)
            FirstViewController.pictureurl = self.userdetails?.pictureUrl
            self.performSegue(withIdentifier: Segue.mainview.id, sender:nil)
            
        })
        { (error) -> Void in
            print(LinkedinStatus.fail.id)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondviewcontroller = segue.destination as! ViewControllerMainScreen
        
        secondviewcontroller.firstName = self.userdetails?.firstName ?? Utilities.default_value.id
        secondviewcontroller.lastName = self.userdetails?.lastName ?? Utilities.default_value.id
        secondviewcontroller.url = self.userdetails?.pictureUrl ?? Utilities.default_value.id
        secondviewcontroller.titles = self.userdetails?.positions?.values?[0].title ??  Utilities.default_value.id
        secondviewcontroller.user = self.userdetails
        
        
    }
    
}
