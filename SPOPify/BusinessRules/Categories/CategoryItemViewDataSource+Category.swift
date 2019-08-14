//
//  CategoryItemViewDataSource+Category.swift
//  POPTalk
//
//  Created by Maher Santina on 8/11/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

extension SPCategory {
    
    func titleForCategoryItemView(_ categoryItemView: CategoryItemView) -> String? {
        return name
    }
    
    // Should display X Bands if there are bands in the category. Otherwise, show N/A (Ticket URL here)
    func detailsForCategoryItemView(_ categoryItemView: CategoryItemView) -> String? {
        guard let numberOfBands = numberOfBands, numberOfBands > 0 else {
            return "N/A"
        }
        
        return "\(numberOfBands) Bands"
    }
    
    func imageForCategoryItemView(_ categoryItemView: CategoryItemView) -> UIImage? {
        return image
    }
}

extension CategoryItemViewDataSource where Self: CategoriesProvider, Self: SPMainListingProvider {
    func titleForCategoryItemView(_ categoryItemView: CategoryItemView) -> String? {
        return category(for: categoryItemView)?.titleForCategoryItemView(categoryItemView)
    }
    
    func detailsForCategoryItemView(_ categoryItemView: CategoryItemView) -> String? {
        return category(for: categoryItemView)?.detailsForCategoryItemView(categoryItemView)
    }
    
    func imageForCategoryItemView(_ categoryItemView: CategoryItemView) -> UIImage? {
        return category(for: categoryItemView)?.imageForCategoryItemView(categoryItemView)
    }
}
