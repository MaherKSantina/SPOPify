//
//  UIStoryboard+Spopify.swift
//  POPTalk
//
//  Created by Maher Santina on 8/11/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

enum ViewControllerType {
    case cateogries
    case bands
    case favoriteBands
    case bandDetails
    
    init?(viewController: UIViewController) {
        switch viewController {
        case is CategoriesViewController:
            self = .cateogries
        case is BandsViewController:
            self = .bands
        case is FavoriteBandsViewController:
            self = .favoriteBands
        case is BandDetailsViewController:
            self = .bandDetails
        default:
            return nil
        }
    }
    
    var storyboard: UIStoryboard {
        switch self {
        case .cateogries, .bands, .favoriteBands, .bandDetails:
            return UIStoryboard(name: "Main", bundle: nil)
        }
    }
    
    var identifier: String {
        switch self {
        case .cateogries:
            return "CategoriesViewController"
        case .bands:
            return "BandsViewController"
        case .favoriteBands:
            return "FavoritesViewController"
        case .bandDetails:
            return "BandDetailsViewController"
        }
    }
    
    var instantiated: UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}
