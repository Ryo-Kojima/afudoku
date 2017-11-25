//
//  postViewController.swift
//  afudoku
//
//  Created by 小嶋涼 on 2017/11/24.
//  Copyright © 2017年 小嶋涼. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
class postViewController: UIViewController {

    @IBOutlet weak var postcomic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var selectedImage: UIImage?
        
//        func postcomic() {
//            var ref: StorageReference!
//            if let uploadData = UIImagePNGRepresentation(self.profileImage.image!) {
//                StorageRef = putData(uploadData,metaData:nil,Completion:{(metadata,error) in
//                    if error != nil {
//                        print(error)
//                        return
//                    }
//                    print(metadata)
//                })
        
//        }
        
//        let storageRef = Storage.reference()
        
        // Do any additional setup after loading the view.
        
    
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




