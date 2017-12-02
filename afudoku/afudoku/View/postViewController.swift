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
    @IBOutlet weak var tap: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tapping = UITapGestureRecognizer(target:self,action: #selector(postViewController.handleSelecttap))
        tap.addGestureRecognizer(tapping)
        tap.isUserInteractionEnabled = true
        
    }
    
    @objc func handleSelecttap() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension postViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction func postbtn(_ sender: Any) {
        var storage = Storage.storage()
        storage = Storage.storage(url:"gs://afudoku-4ebb8.appspot.com/")
        func upload(image: UIImage) {
            let myStorage = storage.reference()
            if let data = UIImagePNGRepresentation(image) as NSData! {
                myStorage.putData(data as Data, metadata: nil) { metadata, error in
                    if (error != nil) {
                        return
                    }
                }
            }
        }
        func download(uid: String, isPartner: Bool) {
            let storageRef = storage.reference()
            let ref = storageRef.child("images/\(uid).png")
            ref.getData(maxSize: 1 * 30 * 30) { (data, error) -> Void in
                if (error != nil) {
                    return
                }else {
                    print(error?.localizedDescription)
                }
            }
        }
        let storyboard: UIStoryboard = UIStoryboard(name: "home", bundle: nil)
        let nextView = storyboard.instantiateInitialViewController()
        present(nextView!, animated: true, completion: nil)
    }
    
}


