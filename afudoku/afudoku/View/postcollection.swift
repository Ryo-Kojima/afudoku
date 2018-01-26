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
    var post: post? {
        didSet {
            self.updateUI()
        }
    }

    func updateUI() {
        
        Database.database().reference().child("upload").observe(.childAdded) {
            (snapshot) in
//            if (self.post?.imagesDownloadURL) != nil {
                for _ in snapshot.children {
            
                    let imageDownloadRef = Storage.storage().reference(forURL:"https://firebasestorage.googleapis.com/v0/b/afudoku-4ebb8.appspot.com/o/images%2F-L29MXIpgNgKrRNxBfdt.jpg?alt=media&token=4eca1f9d-de99-444d-a205-6c69332d78c3")

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
//       }
    }
  }
}
