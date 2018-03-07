//
//  PhotoViewCell.swift
//  Automatic SizingCell
//
//  Created by Mohamed El Hanafi on 06/03/2018.
//  Copyright © 2018 Mintit. All rights reserved.
//

import UIKit

class PhotoViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
    }
    func updateCell(image: UIImage) {
        photo.image = image
    }
}
