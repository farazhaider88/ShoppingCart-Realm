//
//  SubCategoriesCell.swift
//  ShoppingCart
//
//  Created by Faraz Haider on 15/02/2018.
//  Copyright © 2018 Faraz Haider. All rights reserved.
//

import UIKit

protocol SubCategoryDelegate : class {
    func quantityValueChanged(forSubCategoriesCell:SubCategoriesCell, isIncreasing:Bool)
}
class SubCategoriesCell: UITableViewCell {

    @IBOutlet weak var subcategoryQuantity: UILabel!
    @IBOutlet weak var subCategoryPrice: UILabel!
    @IBOutlet weak var subCategoryName: UILabel!
//    var sampleStepperValueForIncrement:Int = Int()

    
    weak var delegate : SubCategoryDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        sampleStepperValueForIncrement = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

//    @IBAction func stepperValueChanged(_ sender: UIStepper) {
//        var isIncreasing : Bool
//        if(Int(sender.value) > sampleStepperValueForIncrement){
//            print("increasing")
//            sampleStepperValueForIncrement += 1
//            isIncreasing = true
//            
//        }
//        else{
//            print("decresing")
//            sampleStepperValueForIncrement =  sampleStepperValueForIncrement - 1
//            isIncreasing = false
//        }
//        delegate?.stepperValueUpdated(steperValue: Int(sender.value), forSubCategoriesCell: self , isIncreasing: isIncreasing)
//    }
    @IBAction func quantityButtonClicked(_ sender: UIButton) {
        var isIncreased :Bool
        if (sender.tag == 100) {
            isIncreased = false
        }
        else
        {
            isIncreased = true
        }
        
        delegate?.quantityValueChanged(forSubCategoriesCell: self, isIncreasing: isIncreased)
    }
}
