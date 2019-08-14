//
//  FavoriteBandsViewController.swift
//  POPTalk
//
//  Created by Maher Santina on 8/11/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

class FavoriteBandsViewController: UIViewController {

    @IBOutlet weak var mainListing: BaseTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainListing.dataSource = self
        mainListing.delegate = self
        mainListing.reloadData()
    }
}

extension FavoriteBandsViewController: BandItemDisplayLocationProvider {
    
    var bandItemDisplayLocation: BandItemDisplayLocation {
        return .favoriteBandsList
    }
}
extension FavoriteBandsViewController: SPBandList {
    var bands: [SPBand] {
        return DataSource.bands.filter{ $0.isFavorite ?? false }
    }
}
