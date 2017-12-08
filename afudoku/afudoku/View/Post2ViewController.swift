//
//  Post2ViewController.swift
//  afudoku
//
//  Created by 小嶋涼 on 2017/12/08.
//  Copyright © 2017年 小嶋涼. All rights reserved.
//

import UIKit
import FirebaseStorage
class Post2ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var comicpost: UIImageView!
    
    var filename = "post"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storageRef = Storage.storage().reference().child("image")
        
        // Do any additional setup after loading the view.
    }

    @IBAction func postbtn(_ sender: AnyObject) {
        guard let image = comicpost.image
            else { return }
        guard let uploadData =  UIImagePNGRepresentation(image)
            else { return }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
