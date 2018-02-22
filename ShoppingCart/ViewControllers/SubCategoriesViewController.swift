//
//  SubCategoriesViewController.swift
//  ShoppingCart
//
//  Created by Faraz Haider on 11/02/2018.
//  Copyright © 2018 Faraz Haider. All rights reserved.
//

import UIKit
import RealmSwift

class SubCategoriesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,SubCategoryDelegate {
    
    @IBOutlet weak var subCategoryTblView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var subCategories:Results<SubCategory>?
    var selectedCategory:Category?{
        didSet{
            loadSubCategories()
        }
    }
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        subCategoryTblView.rowHeight = UITableViewAutomaticDimension
        //        subCategoryTblView.estimatedRowHeight = 100
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(documentsPath)
        subCategoryTblView.separatorStyle = .none
        //        self.loadCategories()
        //        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subCategories?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SubCategoriesCell
        cell.delegate = self
        if let items = subCategories?[indexPath.row]{
            cell.subCategoryName.text = items.subCategoryName
            cell.subCategoryPrice.text = "Rs - \(items.subCategoryPrice)"
            cell.subcategoryQuantity.text = "qt: \(items.quantity)"
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    
    func quantityValueChanged(forSubCategoriesCell: SubCategoriesCell, isIncreasing: Bool) {
        do{
            try self.realm.write {
                var indexPath  = subCategoryTblView .indexPath(for: forSubCategoriesCell)
                if let items = self.subCategories?[(indexPath?.row)!]{
                    if (items.quantity == 1 && !isIncreasing){
                        return
                    }
                    else if(isIncreasing)
                    {
                        items.quantity = items.quantity+1
                    }else{
                        items.quantity = items.quantity-1
                    }
                }
            }
        }catch{
            print("Error in saving subCategories to raelm")
        }
        self.subCategoryTblView.reloadData()
    }
    
    @IBAction func addSubcategories(_ sender: Any) {
        var inputTextField = UITextField()
        var inputTextFieldDescription = UITextField()
        
        let alert = UIAlertController(title: "", message: "Do you want to add Category?", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add Category", style: .default) { (addAction) in
            
            if let categories = self.selectedCategory{
                do{
                    try self.realm.write {
                        let subCategory = SubCategory()
                        subCategory.subCategoryName = inputTextField.text!
                        subCategory.subCategoryDescriton = inputTextFieldDescription.text!
                        subCategory.subCategoryPrice = Int(arc4random_uniform(20) + 100)
                        subCategory.isSubCategoryFavourite = false
                        subCategory.quantity = 1
                        categories.category.append(subCategory)
                    }
                }catch{
                    print("Error in saving subCategories to raelm")
                }
                self.subCategoryTblView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (cancelAction) in
            print("Cancel clicked")
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "SubCategory Name"
            inputTextField = alertTextField
        }
        
        alert.addTextField { (alertDescTextField) in
            alertDescTextField.placeholder = "SubCategory Description"
            inputTextFieldDescription = alertDescTextField
        }
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    func loadSubCategories() {
        subCategories = selectedCategory?.category.sorted(byKeyPath: "subCategoryName")
    }
    
}

