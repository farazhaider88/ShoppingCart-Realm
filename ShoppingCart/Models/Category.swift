//
//  Category.swift
//  ShoppingCart
//
//  Created by Faraz Haider on 11/02/2018.
//  Copyright © 2018 Faraz Haider. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var categoryName : String = ""
    @objc dynamic var categoryDescriton : String = ""
    @objc dynamic var categoryColor : String = ""
    @objc dynamic var dateCategoryAdded : Date?
    var category = List<SubCategory>()
}

