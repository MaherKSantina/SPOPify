//
//  SPBand.swift
//  POPTalk
//
//  Created by Maher Santina on 8/12/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

protocol SPBand {
    var name: String? { get }
    var imageName: String? { get }
    var numberOfSongs: Int? { get }
    var isFavorite: Bool? { get }
}

extension Band: SPBand {  }
