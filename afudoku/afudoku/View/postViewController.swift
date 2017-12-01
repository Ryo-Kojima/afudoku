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
        
        let tapping = UITapGestureRecognizer(target:self,action: #selector(postViewController.handleSelecttap ))
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
    
    @IBAction func postbtn(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "home", bundle: nil)
        let nextView = storyboard.instantiateInitialViewController()
        present(nextView!, animated: true, completion: nil)
    }
    
    
}
extension postViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            tap.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}


