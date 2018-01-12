//
//  SubViewController.swift
//  afudoku
//
//  Created by 小嶋涼 on 2017/12/16.
//  Copyright © 2017年 小嶋涼. All rights reserved.
//

import UIKit
import AVFoundation
class SubViewController: UIViewController {

    @IBOutlet weak var comics: UIImageView!
    var selectedImg: UIImage!
    var audioPlayer: AVAudioPlayer!


    override func viewDidLoad() {
        super.viewDidLoad()
        comics.image = selectedImg

        comics.contentMode = UIViewContentMode.scaleAspectFit
        
        let url = Bundle.main.url(forResource: "music", withExtension: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer.prepareToPlay()
        }
        catch let error as NSError {
            print(error.debugDescription)
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func audio(_ sender: Any) {
        audioPlayer.play()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//
//
}
