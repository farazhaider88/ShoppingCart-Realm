//
//  CategoriesViewController.swift
//  ShoppingCart
//
//  Created by Faraz Haider on 11/02/2018.
//  Copyright © 2018 Faraz Haider. All rights reserved.
//

import UIKit
import RealmSwift

class CategoriesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
    @IBOutlet weak var categoriesTblView: UITableView!
    var categories:Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesTblView.rowHeight = UITableViewAutomaticDimension
        categoriesTblView.estimatedRowHeight = 100
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(documentsPath)
        categoriesTblView.separatorStyle = .none
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
        cell.categoryName.text = "tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:tableView.dequeueReusableCell(withIdentifier:"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    @IBAction func addCategoryButtonClicked(_ sender: Any) {
        var inputTextField = UITextField()
        var alert = UIAlertController(title: "", message: "Do you want to add Category?", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Add Category", style: .default) { (addAction) in
            print("add clicked")
            print("\(inputTextField.text)")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (cancelAction) in
            print("Cancel clicked")
        }
        alert.addTextField { (alertTextField) in
            print("textfield")
            inputTextField = alertTextField
        }
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func saveCategories() {
        
    }
    
    func loadCategories() {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
