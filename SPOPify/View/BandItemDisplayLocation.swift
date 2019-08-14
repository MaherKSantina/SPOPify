//
//  BandItemDisplayLocation.swift
//  POPTalk
//
//  Created by Maher Santina on 8/13/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import Foundation

enum BandItemDisplayLocation {
    case categoryBandsList
    case favoriteBandsList
    case bandDetails
}

protocol BandItemDisplayLocationProvider {
    var bandItemDisplayLocation: BandItemDisplayLocation { get }
}
