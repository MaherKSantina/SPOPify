//
//  SPBandsList+Listing.swift
//  POPTalk
//
//  Created by Maher Santina on 8/12/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

protocol BandProvider {
    var band: SPBand? { get }
}

protocol BandsProvider {
    var bands: [SPBand] { get }
}

extension BandsProvider {
    func band(indexPath: IndexPath) -> SPBand? {
        guard bands.count > indexPath.row else {
            return nil
        }
        return bands[indexPath.row]
    }
}

extension BandsProvider where Self: SPMainListingProvider {
    func band(for bandItemView: BandItemView) -> SPBand? {
        guard let cell = bandItemView.tableViewCell as? BaseTableViewCell<BandItemView>, let indexPath = cell.indexPath else {
            return nil
        }
        return band(indexPath: indexPath)
    }
}

extension BaseTableViewDataSource where Self: BandsProvider, Self: BandItemViewDataSource {
    func baseTableView(_ baseTableView: BaseTableView, numberOfRowsInSection section: Int) -> Int {
        return bands.count
    }
    
    func baseTableViewCellTypeToRegister(_ baseTableView: BaseTableView) -> UITableViewCell.Type {
        return BandItemView.tableViewCell
    }
    
    func baseTableView(_ baseTableView: BaseTableView, configureCell cell: UITableViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? BaseTableViewCell<BandItemView> else {
            return
        }
        cell.mainView?.dataSource = self
    }
}

extension BaseTableViewDelegate where Self: BandsProvider, Self: SPNavigationControllerProvider {
    func baseTableView(_ baseTableView: BaseTableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = ViewControllerType.bandDetails.instantiated as? BandDetailsViewController else {
            return
        }
        vc.band = bands[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

protocol SPBandList: SPMainListingProvider, BandsProvider, SPNavigationControllerProvider, BandItemViewDataSource, BaseTableViewDataSource, BaseTableViewDelegate {  }
