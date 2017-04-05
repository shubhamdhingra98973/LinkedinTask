//
//  PostViewController.swift
//  LinkAPI
//
//  Created by Sierra 4 on 30/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import UIKit

class PostViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var userDetails:UserDetails?
    
    @IBOutlet weak var imgprofilepic: UIImageView!
    @IBOutlet weak var btncamera: UIButton!
    @IBOutlet weak var imgShowSelect: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imgprofilepic.kf.setImage(with: URL(string: FirstViewController.pictureurl!))
    }

    @IBAction func btncameraact(_ sender: Any)
    {
        let image = UIImagePickerController()
        image.delegate = self
        image.allowsEditing = false
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(image,animated:true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let  profileImage = info[UIImagePickerControllerOriginalImage] as? UIImage!
        {
            imgShowSelect.image =  profileImage
        }
        else
        {
            print(Error.error_msg.id)
        }
        self.dismiss(animated: true,completion: nil)

    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func btnback(_ sender: UIButton) {
         self.navigationController?.popViewController(animated: true)
    }

}
