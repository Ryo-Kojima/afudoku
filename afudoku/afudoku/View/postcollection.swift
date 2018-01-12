//
//  postcollection.swift
//  afudoku
//
//  Created by 小嶋涼 on 2017/12/22.
//  Copyright © 2017年 小嶋涼. All rights reserved.
//

import UIKit
import Firebase
class postcollection: UICollectionViewCell {
    
    
    @IBOutlet var image: UIImageView!
    var post: post! {
        didSet {
            self.updateUI()
        }
    }

    func updateUI() {
        
        Database.database().reference().child("upload").observe(.childAdded) {
            (snapshot) in
//            if let imageDownloadURL = self.post.imagesDownloadURL {
//            for child in snapshot.children {
            
            let imageDownloadRef = Storage.storage().reference(forURL:"https://firebasestorage.googleapis.com/v0/b/afudoku-4ebb8.appspot.com/o/images%2F-L2dCs4IGADEU_SqHMmT.jpg?alt=media&token=4e9e75cf-ee4a-4f3a-9128-9105c8a40c55")
            
            imageDownloadRef.getData(maxSize: 5 * 1024 * 1024, completion: {[weak self]
                (data,error) in
                if let error = error {
                    print("error:\(error)")
                }
                else {
                    if data != nil {
                        let image = UIImage(data: data!)
                        self?.image.image = image
                    }
                }
              })
        }
    }
}

