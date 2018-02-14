//
//  SubCategoriesCell.swift
//  ShoppingCart
//
//  Created by Faraz Haider on 15/02/2018.
//  Copyright © 2018 Faraz Haider. All rights reserved.
//

import UIKit

protocol SubCategoryDelegate : class {
    func stepperValueUpdated(steperValue:Double)
}
class SubCategoriesCell: UITableViewCell {

    @IBOutlet weak var subcategoryQuantity: UILabel!
    @IBOutlet weak var subCategoryPrice: UILabel!
    @IBOutlet weak var subCategoryName: UILabel!
    
    weak var delegate : SubCategoryDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        delegate?.stepperValueUpdated(steperValue: sender.value)
    }
}
