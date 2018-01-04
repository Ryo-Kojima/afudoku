//
//  imagescolect.swift
//  afudoku
//
//  Created by 小嶋涼 on 2017/12/21.
//  Copyright © 2017年 小嶋涼. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

class post {
    var imagesDownloadURL: String?
    private var images: UIImage!
    
    init(image:UIImage) {
        self.images = image
    }
    init(snapshot: DataSnapshot) {
//        let json = JSON(snapshot.value ?? NSValue.self)
//        self.imagesDownloadURL = json["imageDownloadURL"].stringValue
//        if let value = value as? NSDictionary {
//            for (k, v) in value {
//                if let report = Report.factory(id: k as! String, _data: v) {
//                    self.reports[k as! String] = report
//                }
//            }
//        }
    }
    func save() {
        let updata = Database.database().reference().child("upload").childByAutoId()
        let newPhoto = updata.key
        
        if let imagedata = UIImageJPEGRepresentation(self.images,0.1) {
            let storageRef = Storage.storage().reference().child("images")
            let newimagesRef = storageRef.child(newPhoto + ".jpg")
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"
            newimagesRef.putData(imagedata,metadata: metadata).observe(.success, handler:
                { (snapshot) in
                self.imagesDownloadURL = snapshot.metadata?.downloadURL()?.absoluteString
                let newPostDictionary = ["imageDownloadURL" : self.imagesDownloadURL]
                    
                updata.setValue(newPostDictionary)
            })
        }
    }
}
