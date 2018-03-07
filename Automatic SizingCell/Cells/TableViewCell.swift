//
//  TableViewCell.swift
//  Automatic SizingCell
//
//  Created by Mohamed El Hanafi on 05/03/2018.
//  Copyright © 2018 Mintit. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var variableLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCellWithData(name: String, description: String, variable: String?){
        self.nameLabel.text = name
        self.descriptionLabel.text = description
        self.variableLabel.text = variable
        
    }
    
}
