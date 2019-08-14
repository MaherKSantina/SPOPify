//
//  SPCategory+Listing.swift
//  POPTalk
//
//  Created by Maher Santina on 8/12/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

protocol CategoriesProvider {
    var categories: [SPCategory] { get }
}

extension CategoriesProvider {
    func category(indexPath: IndexPath) -> SPCategory? {
        guard categories.count > indexPath.row else {
            return nil
        }
        return categories[indexPath.row]
    }
}

extension CategoriesProvider where Self: SPMainListingProvider {
    func category(for categoryItemView: CategoryItemView) -> SPCategory? {
        guard let cell = categoryItemView.tableViewCell as? BaseTableViewCell<CategoryItemView>, let indexPath = cell.indexPath else {
            return nil
        }
        return category(indexPath: indexPath)
    }
}

extension BaseTableViewDataSource where Self: CategoriesProvider, Self: CategoryItemViewDataSource {
    func baseTableView(_ baseTableView: BaseTableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func baseTableViewCellTypeToRegister(_ baseTableView: BaseTableView) -> UITableViewCell.Type {
        return CategoryItemView.tableViewCell
    }
    
    func baseTableView(_ baseTableView: BaseTableView, configureCell cell: UITableViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? BaseTableViewCell<CategoryItemView> else {
            return
        }
        cell.mainView?.dataSource = self
    }
}

extension BaseTableViewDelegate where Self: CategoriesProvider, Self: SPNavigationControllerProvider {
    func baseTableView(_ baseTableView: BaseTableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewControllerType.bands.instantiated
        navigationController?.pushViewController(vc, animated: true)
    }
}

protocol SPCategoryList: SPMainListingProvider, CategoriesProvider, SPNavigationControllerProvider, CategoryItemViewDataSource, BaseTableViewDataSource, BaseTableViewDelegate {  }
