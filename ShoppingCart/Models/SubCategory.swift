//
//  SubCategory.swift
//  ShoppingCart
//
//  Created by Faraz Haider on 11/02/2018.
//  Copyright © 2018 Faraz Haider. All rights reserved.
//

import Foundation
import RealmSwift

class SubCategory: Object {
    @objc dynamic var subCategoryName : String = ""
    @objc dynamic var subCategoryDescriton : String = ""
    @objc dynamic var subCategoryPrice : Int = 0
    @objc dynamic var isSubCategoryFavourite : Bool = false
    @objc dynamic var quantity : Int = 0
    var parentSubCategory = LinkingObjects(fromType: Category.self, property: "category")
}

