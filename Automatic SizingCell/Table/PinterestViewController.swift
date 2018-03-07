//
//  PinterestViewController.swift
//  Automatic SizingCell
//
//  Created by Mohamed El Hanafi on 06/03/2018.
//  Copyright © 2018 Mintit. All rights reserved.
//

import UIKit

class PinterestViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource{
    
    var images:[UIImage] = []
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 1..<9 {
            images.append(UIImage(named: "\(i)")!)
        }
        //collectionView.backgroundColor = UIColor.black
        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 10, bottom: 10, right: 10)
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoViewCell", for: indexPath) as! PhotoViewCell
        cell.updateCell(image: images[indexPath.item])
        return cell
    }
}
//MARK: - PINTEREST LAYOUT DELEGATE
extension PinterestViewController : PinterestLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return images[indexPath.item].size.height
    }
    
}
