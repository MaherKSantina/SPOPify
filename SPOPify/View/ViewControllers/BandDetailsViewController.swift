//
//  BandDetailsViewController.swift
//  POPTalk
//
//  Created by Maher Santina on 8/11/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

class BandDetailsViewController: UIViewController {
    
    @IBOutlet weak var mainBandItemView: BandItemView!
    
    var band: SPBand?

    override func viewDidLoad() {
        super.viewDidLoad()
        mainBandItemView.dataSource = self
    }

}

extension BandDetailsViewController: BandProvider { }

extension BandDetailsViewController: BandItemDisplayLocationProvider {
    var bandItemDisplayLocation: BandItemDisplayLocation {
        return .bandDetails
    }
}

extension BandDetailsViewController: BandItemViewDataSource { }
