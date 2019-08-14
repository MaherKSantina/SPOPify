//
//  CategoryItemView.swift
//  POPTalk
//
//  Created by Maher Santina on 8/8/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

protocol CategoryItemViewDataSource {
    func titleForCategoryItemView(_ categoryItemView: CategoryItemView) -> String?
    func detailsForCategoryItemView(_ categoryItemView: CategoryItemView) -> String?
    func imageForCategoryItemView(_ categoryItemView: CategoryItemView) -> UIImage?
}

class CategoryItemView: MSAutoView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    var dataSource: CategoryItemViewDataSource? {
        didSet {
            updateView()
        }
    }
    
    override func updateView() {
        super.updateView()
        titleLabel.text = dataSource?.titleForCategoryItemView(self)
        detailsLabel.text = dataSource?.detailsForCategoryItemView(self)
        mainImageView.image = dataSource?.imageForCategoryItemView(self)
    }

}
