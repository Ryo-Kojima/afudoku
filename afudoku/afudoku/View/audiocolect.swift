//
//  audiocolect.swift
//  AppIcon
//
//  Created by 小嶋涼 on 2018/01/27.
//  Copyright © 2018年 小嶋涼. All rights reserved.
//

import Foundation
import AVFoundation
import Firebase
import SwiftyJSON

class post2 {
    var audioDownloadURL: String?
    private var images: UIImage!
    
    init(image:UIImage) {
        self.images = image
    }
    init(snapshot: DataSnapshot) {
        let json = JSON(snapshot.value ?? NSValue.self)
        self.audioDownloadURL = json["audioDownloadURL"].stringValue
        //        if let value = value as? NSDictionary {
        //            for (k, v) in value {
        //                if let report = Report.factory(id: k as! String, _data: v) {
        //                    self.reports[k as! String] = report
        //                }
        //            }
        //        }
    }
    func save() {
        let updata = Database.database().reference().child("upload2").childByAutoId()
        let newPhoto = updata.key
        
        if let imagedata = UIImageJPEGRepresentation(self.images,0.5) {
            let storageRef = Storage.storage().reference().child("audio")
            let newimagesRef = storageRef.child(newPhoto + ".mp3")
            let metadata = StorageMetadata()
            metadata.contentType = "audio/mp3"
            newimagesRef.putData(imagedata,metadata: metadata).observe(.success, handler:
                { (snapshot) in
                    self.audioDownloadURL = snapshot.metadata?.downloadURL()?.absoluteString
                    let newPostDictionary = ["audioDownloadURL" : self.audioDownloadURL]
                    
                    updata.setValue(newPostDictionary)
            })
        }
    }
}

