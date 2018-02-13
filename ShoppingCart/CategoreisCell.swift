//
//  CategoreisCell.swift
//  ShoppingCart
//
//  Created by Faraz Haider on 13/02/2018.
//  Copyright © 2018 Faraz Haider. All rights reserved.
//

import UIKit

class CategoreisCell: UITableViewCell {
    
    @IBOutlet weak var categoryPicture: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
