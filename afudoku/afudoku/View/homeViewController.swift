//
//  homeViewController.swift
//  afudoku
//
//  Created by 小嶋涼 on 2017/12/09.
//  Copyright © 2017年 小嶋涼. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
class homeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var comic: UICollectionView!
    var selectedImage: UIImage?
    let comics: [String] = ["manga1","manga2","manga3","manga4","manga5","post"]
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let testcell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath)
        let imageview = testcell.contentView.viewWithTag(1) as! UIImageView
        let imageviewcell = UIImage(named:comics[indexPath.row])
        imageview.image = imageviewcell
        let url = comic
        if case let comic(user.downloadurl) {
            URLSession.sharedSession.datacampTaskWithURL()
        }
        return testcell
    }
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        selectedImage = UIImage(named: comics[indexPath.row])
        if selectedImage != nil {
            performSegue(withIdentifier: "Cell",sender: nil)
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
//        if (segue.identifier == "Cell") {
//            let subVC: SubViewController = (segue.destination as? SubViewController)!
//            subVC.selectedImg = selectedImage
//        }
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt:IndexPath) -> CGSize {
        let cellsize: CGFloat = self.view.bounds.width/2.2-15
        return CGSize(width: cellsize, height: cellsize)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        let imageName = NSUUID().uuidString
//        let downloadRef = Storage.storage()
//        let storageRef = downloadRef.reference(forURL:"gs://afudoku-4ebb8.appspot.com/")
//        let image = storageRef.child("images").child("\(imageName).png")
//
//        image.dataMaxSize(1*1024*1024) {
//            data in
//            print(data)
//            print(error)
//        }
        // Do any additional setup after loading the view.
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
