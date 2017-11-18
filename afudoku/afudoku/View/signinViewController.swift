//
//  signinViewController.swift
//  log
//
//  Created by 小嶋涼 on 2017/10/13.
//  Copyright © 2017年 小嶋涼. All rights reserved.
//

import UIKit
import FirebaseAuth
class signinViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var signin_btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        handleTextFeild()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func handleTextFeild() {
        email.addTarget(self, action: #selector(signinViewController.textFeildDidChange), for: UIControlEvents.editingChanged)
        password.addTarget(self, action: #selector(signinViewController.textFeildDidChange), for: UIControlEvents.editingChanged)
    }
    @objc func textFeildDidChange() {
        guard let email = email.text, !email.isEmpty, let password = password.text, !password.isEmpty
            else {
                signin_btn.setTitleColor(UIColor.lightText, for: UIControlState.normal)
                signin_btn.isEnabled = false
                return
        }
        signin_btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        signin_btn.isEnabled = true
    }
    @IBAction func signin_touch(_ sender: Any) {
        Auth.auth().signIn(withEmail:email.text!,password: password.text!,completion:{(user,error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            self.performSegue(withIdentifier: "signintotabar", sender: nil)
        })
    }
    
    
}
