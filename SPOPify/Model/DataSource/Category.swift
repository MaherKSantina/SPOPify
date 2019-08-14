//
//  Category.swift
//  POPTalk
//
//  Created by Maher Santina on 8/11/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

// MARK: - Category
struct Category: Codable {
    let mainDetails: MainDetails?
    let secondaryDetails: SecondaryDetails?
    let metaData: MetaData?
    let numberOfPopularBands: Int?
    let numberOfNonPopularBands: Int?
    
    enum CodingKeys: String, CodingKey {
        case mainDetails = "main_details"
        case secondaryDetails = "secondary_details"
        case metaData = "meta-data"
        case numberOfPopularBands = "number_of_popular_bands"
        case numberOfNonPopularBands = "number_of_non_popular_bands"
    }
}

// MARK: - MainDetails
struct MainDetails: Codable {
    let nameFirstSection: String?
    let imageName: String?
    
    enum CodingKeys: String, CodingKey {
        case nameFirstSection = "name_first_section"
        case imageName = "image_name"
    }
}

// MARK: - MetaData
struct MetaData: Codable {
    let unusedStatusKey: String?
    let executeOrder66: Bool?
    
    enum CodingKeys: String, CodingKey {
        case unusedStatusKey = "unused_status_key"
        case executeOrder66 = "execute_order_66"
    }
}

// MARK: - SecondaryDetails
struct SecondaryDetails: Codable {
    let nameSecondSection: String?
    let imageExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case nameSecondSection = "name_second_section"
        case imageExtension = "image_extension"
    }
}
