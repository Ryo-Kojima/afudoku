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
        postcomic.addGestureRecognizer(tapping)
        postcomic.isUserInteractionEnabled = true
        
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
            postcomic.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction func postbtn(_ sender: Any) {
        
        let storage = Storage.storage().reference().child(String(describing: postcomic))
        
        if let uploaData = UIImagePNGRepresentation(postcomic.image!) {
            storage.putData(uploaData, metadata: nil) { (metadata, error) in
                if (error != nil) {
                    print(error)
                    return
                }
                
                print(metadata)
            }
        }
        func download(uid: String, isPartner: Bool) {
            storage.getData(maxSize: 1 * 30 * 30) { (data, error) -> Void in
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


