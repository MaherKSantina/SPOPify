//
//  ViewController.swift
//  POPTalk
//
//  Created by Maher Santina on 8/8/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var mainListing: BaseTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        mainListing.dataSource = self
        mainListing.delegate = self
        mainListing.reloadData()
    }
}

extension CategoriesViewController: SPCategoryList {
    
    var categories: [SPCategory] {
        return DataSource.categories
    }
    
}
