//
//  BandsViewController.swift
//  POPTalk
//
//  Created by Maher Santina on 8/11/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

class BandsViewController: UIViewController {

    @IBOutlet weak var mainListing: BaseTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainListing.dataSource = self
        mainListing.delegate = self
        mainListing.reloadData()
    }
}

extension BandsViewController: BandItemDisplayLocationProvider {
    
    var bandItemDisplayLocation: BandItemDisplayLocation {
        return .categoryBandsList
    }
}
extension BandsViewController: SPBandList {
    var bands: [SPBand] {

        // Mock Data, uncomment for testing purposes
//        struct MockBand: SPBand {
//            var name: String? = "Nightwish"
//            var imageName: String? = "nightwish"
//            var numberOfSongs: Int? = 150
//            var isFavorite: Bool? = true
//
//        }
//        return [MockBand(), MockBand(), MockBand()]
        return DataSource.bands
    }
}


