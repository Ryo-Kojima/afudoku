//
//  post2ViewController.swift
//  afudoku
//
//  Created by 小嶋涼 on 2017/12/30.
//  Copyright © 2017年 小嶋涼. All rights reserved.
//

import UIKit
import Firebase


class post2ViewController: UIViewController {

    
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var tap: UIImageView!
    var takenImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapping = UITapGestureRecognizer(target:self,action: #selector(postViewController.handleSelecttap))
        images.addGestureRecognizer(tapping)
        images.isUserInteractionEnabled = true
    }
    @objc func handleSelecttap() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        pickerController.allowsEditing = true
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
extension post2ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info["UIImagePickerControllerOriginalImage"] as! UIImage
        self.takenImage = image
        self.images.image = self.takenImage
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func postbtn(_ sender: Any) {
        if takenImage != nil {
            let newpost = post(image: takenImage)
            newpost.save()
        }
        let storyboard: UIStoryboard = UIStoryboard(name: "home", bundle: nil)
        let nextView = storyboard.instantiateInitialViewController()
        self.tabBarController?.navigationController?.present(nextView!, animated: true, completion: nil)
        tabBarController?.selectedIndex = 0
    }
}
