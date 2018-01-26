//
//  Gpost.swift
//  AppIcon
//
//  Created by 小嶋涼 on 2018/01/15.
//  Copyright © 2018年 小嶋涼. All rights reserved.
//

import Firebase
struct Gpost {
    
    let key: String!
    let url: String!
    
    let itemRef: DatabaseReference?
    
    init(url:String,key:String) {
        self.key = key
        self.url = url
        self.itemRef = nil
    }
    init(snapshot:DataSnapshot) {
        key = snapshot.key
        itemRef = snapshot.ref
        
        let snapshotValue = snapshot.value as? NSDictionary
        
        if let imageUrl = snapshotValue?["url"] as? String {
            url = imageUrl
        }
        else {
            url = ""
        }
    }
}
