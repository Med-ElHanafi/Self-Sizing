//
//  CollectionViewCell.swift
//  Automatic SizingCell
//
//  Created by Mohamed El Hanafi on 06/03/2018.
//  Copyright © 2018 Mintit. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var variableLabel: UILabel!
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.width
        widthConstraint.constant = screenWidth - (2 * 12)
    }
    func updateCellWithData(name: String, description: String, variable: String?){
        self.nameLabel.text = name
        self.descriptionLabel.text = description
        self.variableLabel.text = variable
    }

}
