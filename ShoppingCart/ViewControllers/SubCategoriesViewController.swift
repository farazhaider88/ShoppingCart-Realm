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
        cell.subCategoryName.text = "ABC"
        cell.subCategoryPrice.text = "13 AED"
        cell.subcategoryQuantity.text = "0"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }

    func stepperValueUpdated(steperValue: Double) {
        print("\(steperValue)")
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
