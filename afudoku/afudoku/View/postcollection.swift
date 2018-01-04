//
//  postcollection.swift
//  afudoku
//
//  Created by 小嶋涼 on 2017/12/22.
//  Copyright © 2017年 小嶋涼. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage
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
            
            let imageDownloadRef = Storage.storage().reference(forURL:"https://firebasestorage.googleapis.com/v0/b/afudoku-4ebb8.appspot.com/o/images%2F-L1uuaYENp9-doHKxdVC.jpg?alt=media&token=2eb76b55-bcea-432f-82f8-75bc6f81f110")
            let imageDownloadRef2 = Storage.storage().reference(forURL:"https://firebasestorage.googleapis.com/v0/b/afudoku-4ebb8.appspot.com/o/images%2F-L1vUw-qD_gGmfvX8YL6.jpg?alt=media&token=ce273f40-26e4-4722-a70d-a0203eb4d014")
            
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
            imageDownloadRef2.getData(maxSize: 5 * 1024 * 1024, completion: {[weak self]
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

