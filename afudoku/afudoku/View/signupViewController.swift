//
//  signupViewController.swift
//  log
//
//  Created by 小嶋涼 on 2017/10/14.
//  Copyright © 2017年 小嶋涼. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class signupViewController: UIViewController {
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var signup_btn: UIButton!
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user.backgroundColor = UIColor.clear
        user.tintColor = UIColor.blue
        user.textColor = UIColor.black
        user.attributedPlaceholder = NSAttributedString(string: user.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        
        let bottomLayerUser = CALayer()
        bottomLayerUser.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.6)
        bottomLayerUser.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        user.layer.addSublayer(bottomLayerUser)
        
        email.backgroundColor = UIColor.clear
        email.tintColor = UIColor.blue
        email.textColor = UIColor.black
        email.attributedPlaceholder = NSAttributedString(string: email.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        
        let bottomLayerEmail = CALayer()
        bottomLayerEmail.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.6)
        bottomLayerEmail.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        email.layer.addSublayer(bottomLayerEmail)
        
        password.backgroundColor = UIColor.clear
        password.tintColor = UIColor.blue
        password.textColor = UIColor.black
        password.attributedPlaceholder = NSAttributedString(string: password.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        
        let bottomLayerPassword = CALayer()
        bottomLayerPassword.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.6)
        bottomLayerPassword.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        password.layer.addSublayer(bottomLayerPassword)
        
        profileImage.layer.cornerRadius = 40
        profileImage.clipsToBounds = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(signupViewController.handleSelectProfileImageView))
        profileImage.addGestureRecognizer(tapGesture)
        profileImage.isUserInteractionEnabled = true
        
        handleTextFeild()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func handleTextFeild() {
        user.addTarget(self, action: #selector(signupViewController.textFeildDidChange), for: UIControlEvents.editingChanged)
        email.addTarget(self, action: #selector(signupViewController.textFeildDidChange), for: UIControlEvents.editingChanged)
        password.addTarget(self, action: #selector(signupViewController.textFeildDidChange), for: UIControlEvents.editingChanged)
    }
    
    @objc func textFeildDidChange() {
        guard let username = user.text, !username.isEmpty, let email = email.text, !email.isEmpty, let password = password.text, !password.isEmpty
            else {
                signup_btn.setTitleColor(UIColor.lightText, for: UIControlState.normal)
                signup_btn.isEnabled = false
                return
        }
        signup_btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        signup_btn.isEnabled = true
    }
    
    @objc func handleSelectProfileImageView() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }

    @IBAction func dismiss_onClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func signUp_btn(_ sender: Any) {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion: {(user: User, error: Error?)in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            var ref: DatabaseReference!
            
ref = Database.database().reference()
            let usersReference = ref.child("users")
            print(ref.description()); //https://afudoku-4ebb8.firebaseio.com/
            let uid = user.uid
            let newUserReference = usersReference.child(uid)
            usersReference.setValue(["username" : self.user.text!,"email" : self.email.text!])
            print("description: \(usersReference.description())")
            print(user)
            } as? AuthResultCallback
        
        )}
}

extension signupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            profileImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
