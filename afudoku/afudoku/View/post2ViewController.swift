//
//  post2ViewController.swift
//  afudoku
//
//  Created by 小嶋涼 on 2017/12/30.
//  Copyright © 2017年 小嶋涼. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
//import Jukebox
class post2ViewController: UIViewController {

    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var tap: UIImageView!
    var takenImage: UIImage!
//    var jukebox : Jukebox!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapping = UITapGestureRecognizer(target:self,action: #selector(post2ViewController.handleSelecttap))
        images.addGestureRecognizer(tapping)
        images.isUserInteractionEnabled = true
        
//        let delay = DispatchTime.now() + Double(Int64(3 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
//        DispatchQueue.main.asyncAfter(deadline: delay) {
//            self.jukebox.append(item: JukeboxItem (URL: URL(string: "http://www.noiseaddicts.com/samples_1w72b820/2228.mp3")!), loadingAssets: true)
//        }
//        func remoteControlReceived(with event: UIEvent?) {
//            if event?.type == .remoteControl {
//                switch event!.subtype {
//                case .remoteControlPlay :
//                    jukebox.play()
//                default:
//                    break
//                }
//            }
//        }
    }
    @objc func handleSelecttap() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(pickerController, animated: true, completion: nil)
    }
//    override func remoteControlReceived(with event: UIEvent?) {
//        if event?.type == .remoteControl {
//            switch event!.subtype {
//            case .remoteControlPlay :
//                jukebox.play()
//            case .remoteControlPause :
//                jukebox.pause()
//            case .remoteControlNextTrack :
//                jukebox.playNext()
//            case .remoteControlPreviousTrack:
//                jukebox.playPrevious()
//            case .remoteControlTogglePlayPause:
//                if jukebox.state == .playing {
//                    jukebox.pause()
//                } else {
//                    jukebox.play()
//                }
//            default:
//                break
//            }
//        }
//    }
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
        let newpost = post(image: takenImage)
//        newpost.enter()
        let storyboard: UIStoryboard = UIStoryboard(name: "home", bundle: nil)
        let nextView = storyboard.instantiateInitialViewController()
        self.tabBarController?.navigationController?.present(nextView!, animated: true, completion: nil)
        tabBarController?.selectedIndex = 0
    }
}
