//
//  homeViewController.swift
//  afudoku
//
//  Created by 小嶋涼 on 2017/12/09.
//  Copyright © 2017年 小嶋涼. All rights reserved.
//

import UIKit
import Firebase
class homeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var comic: UICollectionView!
    
    @IBOutlet weak var image: UIImageView!
    var posts = [post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        // Do any additional setup after loading the view.

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfRowsInSection section: Int) -> Int {

        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let images = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! postcollection
        images.updateUI()
        return images
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize:CGFloat = self.view.bounds.width/2-5
        return CGSize(width: cellSize, height: cellSize)
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
