//
//  CategoryItemView.swift
//  POPTalk
//
//  Created by Maher Santina on 8/8/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

protocol BandItemViewDataSource {
    func titleForBandItemView(_ bandItemView: BandItemView) -> String?
    func detailsForBandItemView(_ bandItemView: BandItemView) -> String?
    func imageForBandItemView(_ bandItemView: BandItemView) -> UIImage?
    func favoriteImageIsHiddenForBandItemView(_ bandItemView: BandItemView) -> Bool?
    func disclosureIsHiddenForBandItemView(_ bandItemView: BandItemView) -> Bool?
}

class BandItemView: MSAutoView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var favoriteImageParentView: UIView!
    @IBOutlet weak var disclosureImageParentView: UIView!
    
    var dataSource: BandItemViewDataSource? {
        didSet {
            updateView()
        }
    }
    
    override func updateView() {
        super.updateView()
        titleLabel.text = dataSource?.titleForBandItemView(self)
        detailsLabel.text = dataSource?.detailsForBandItemView(self)
        mainImageView.image = dataSource?.imageForBandItemView(self)
        favoriteImageParentView.isHidden = dataSource?.favoriteImageIsHiddenForBandItemView(self) ?? true
        disclosureImageParentView.isHidden = dataSource?.disclosureIsHiddenForBandItemView(self) ?? false
    }

}
