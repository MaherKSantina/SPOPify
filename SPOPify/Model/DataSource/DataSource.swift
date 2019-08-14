//
//  DataSource.swift
//  POPTalk
//
//  Created by Maher Santina on 8/11/19.
//  Copyright © 2019 Maher Santina. All rights reserved.
//

import UIKit

var categoriesJSON = "[ { \"main_details\": { \"name_first_section\": \"Heavy\", \"image_name\": \"heavyMetal\" }, \"secondary_details\": { \"name_second_section\": \"Metal\", \"image_extension\": \".png\" }, \"meta-data\": { \"unused_status_key\": \"very_important_status_code\", \"execute_order_66\": true }, \"number_of_popular_bands\": 1, \"number_of_non_popular_bands\": 3 }, { \"main_details\": { \"name_first_section\": \"Progressive\", \"image_name\": \"progressiveMetal\" }, \"secondary_details\": { \"name_second_section\": \"Metal\", \"image_extension\": \".png\" }, \"meta-data\": { \"unused_status_key\": \"very_important_status_code\", \"execute_order_66\": true }, \"number_of_popular_bands\": 1, \"number_of_non_popular_bands\": 3 } ]"

var bandsJSON = "[ { \"name\": \"Iron Maiden\", \"imageName\": \"ironMaiden\", \"numberOfSongs\": 100, \"isFavorite\": true }, { \"name\": \"Metallica\", \"imageName\": \"metallica\", \"numberOfSongs\": 200, \"isFavorite\": false } ]"

class DataSource {
    static var categories: [Category] = try! JSONDecoder().decode([Category].self, from: categoriesJSON.data(using: .utf8)!)
    static var bands: [Band] = try! JSONDecoder().decode([Band].self, from: bandsJSON.data(using: .utf8)!)
}
