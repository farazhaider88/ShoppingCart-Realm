//
//  CategoriesViewController.swift
//  ShoppingCart
//
//  Created by Faraz Haider on 11/02/2018.
//  Copyright © 2018 Faraz Haider. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoriesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var categoriesTblView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var categories:Results<Category>?
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesTblView.rowHeight = UITableViewAutomaticDimension
        categoriesTblView.estimatedRowHeight = 100
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(documentsPath)
        categoriesTblView.separatorStyle = .none
        self.loadCategories()
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CategoreisCell
        
        if let category = categories?[indexPath.row]{
        
            cell.categoryName.text = category.categoryName
            cell.categoryDescription.text = category.categoryDescriton
            cell.backgroundColor = UIColor(hexString:category.categoryColor)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm - MMM dd, yyyy"
            let todaysDate = dateFormatter.string(from: category.dateCategoryAdded!)
            
            cell.categoryAddedDate.text = todaysDate
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showSubCategory", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSubCategory"{
            let controller = segue.destination as! SubCategoriesViewController
            if let indexPath = categoriesTblView.indexPathForSelectedRow {
                controller.selectedCategory = categories?[indexPath.row]
            }
            
        }
    }
    
    @IBAction func addCategoryButtonClicked(_ sender: Any) {
        
        var inputTextField = UITextField()
        var inputTextFieldDescription = UITextField()
        
        let alert = UIAlertController(title: "", message: "Do you want to add Category?", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add Category", style: .default) { (addAction) in
            let category = Category()
            category.categoryName = inputTextField.text!
            category.categoryDescriton = inputTextFieldDescription.text!
            category.categoryColor = UIColor.randomFlat.hexValue()
            category.dateCategoryAdded = Date()
            self.saveCategories(category: category)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (cancelAction) in
            print("Cancel clicked")
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Category Name"
            inputTextField = alertTextField
        }
        
        alert.addTextField { (alertDescTextField) in
            alertDescTextField.placeholder = "Category Description"
            inputTextFieldDescription = alertDescTextField
        }
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func saveCategories(category:Category) {
        do{
            try realm.write {
                realm.add(category)
            }
        }catch{
           print("Error in saving category to raelm")
        }
        categoriesTblView.reloadData()
    }
    
    func loadCategories() {
        categories = realm.objects(Category.self)
        categoriesTblView.reloadData()
    }
    
}

extension CategoriesViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("UISearchBar, textDidChange")
        if (searchBar.text?.count)! <= 0
        {
            loadCategories()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarSearchButtonClicked")
        categories = categories?.filter("categoryName CONTAINS[cd] %@",searchBar.text!)
        categoriesTblView.reloadData()
    }
}
