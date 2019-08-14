//
//  SPCategory.swift
//  POPTalk
//
//  Created by Maher Santina on 8/12/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

protocol SPCategory {
    var name: String? { get }
    var image: UIImage? { get }
    var numberOfBands: Int? { get }
}

extension Category: SPCategory {
    var name: String? {
        return "\(mainDetails?.nameFirstSection ?? "") \(secondaryDetails?.nameSecondSection ?? "")"
    }
    
    var image: UIImage? {
        return UIImage(named: mainDetails?.imageName ?? "")
    }
    
    var numberOfBands: Int? {
        return (numberOfPopularBands ?? 0) + (numberOfNonPopularBands ?? 0)
    }
}
