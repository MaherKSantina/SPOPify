//
//  BandItemViewDisplayable+Band.swift
//  POPTalk
//
//  Created by Maher Santina on 8/12/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

extension SPBand {
    func titleForBandItemView(_ bandItemView: BandItemView) -> String? {
        return name
    }
    
    func detailsForBandItemView(_ bandItemView: BandItemView) -> String? {
        return "\(numberOfSongs ?? 0) Songs"
    }
    
    func imageForBandItemView(_ bandItemView: BandItemView) -> UIImage? {
        return UIImage(named: imageName ?? "")
    }
}

extension BandItemViewDataSource where Self: BandsProvider, Self: SPMainListingProvider {
    
    func titleForBandItemView(_ bandItemView: BandItemView) -> String? {
        return band(for: bandItemView)?.titleForBandItemView(bandItemView)
    }
    
    func detailsForBandItemView(_ bandItemView: BandItemView) -> String? {
        return band(for: bandItemView)?.detailsForBandItemView(bandItemView)
    }
    
    func imageForBandItemView(_ bandItemView: BandItemView) -> UIImage? {
        return band(for: bandItemView)?.imageForBandItemView(bandItemView)
    }
    
}

extension BandItemViewDataSource where Self: BandProvider {
    
    func titleForBandItemView(_ bandItemView: BandItemView) -> String? {
        return band?.titleForBandItemView(bandItemView)
    }
    
    func detailsForBandItemView(_ bandItemView: BandItemView) -> String? {
        return band?.detailsForBandItemView(bandItemView)
    }
    
    func imageForBandItemView(_ bandItemView: BandItemView) -> UIImage? {
        return band?.imageForBandItemView(bandItemView)
    }
    
}

extension BandItemViewDataSource where Self: BandItemDisplayLocationProvider {
    
    // Band item should not have a disclosure on the band details screen (Insert ticket URL here)
    func disclosureIsHiddenForBandItemView(_ bandItemView: BandItemView) -> Bool? {
        switch bandItemDisplayLocation {
        case .categoryBandsList, .favoriteBandsList:
            return false
        case .bandDetails:
            return true
        }
    }
}

// If I know the location of the band item view, I can hide/show the favorite and disclosure images accordingly
extension BandItemViewDataSource where Self: BandItemDisplayLocationProvider, Self: BandsProvider, Self: SPMainListingProvider {
    
    // Business logic for the favorite image (Insert ticket URL here)
    func favoriteImageIsHiddenForBandItemView(_ bandItemView: BandItemView) -> Bool? {
        switch bandItemDisplayLocation {
            
            // Favorite should be hidden in the bands list
        case .categoryBandsList:
            return true
            
            // Favorite icon should be shown based on the favorite state for the user
             case .bandDetails:
            return !(band(for: bandItemView)?.isFavorite ?? false)
            
            // Favorite icon should always be shown in the favorite list
        case .favoriteBandsList:
            return false
        }
    }
}

extension BandItemViewDataSource where Self: BandItemDisplayLocationProvider, Self: BandProvider {
    func favoriteImageIsHiddenForBandItemView(_ bandItemView: BandItemView) -> Bool? {
        return !(band?.isFavorite ?? false)
    }
}
