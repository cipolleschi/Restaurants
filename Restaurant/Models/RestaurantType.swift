//
//  RestaurantType.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 17/10/21.
//

import Foundation

enum RestaurantType: CaseIterable {
    case japanese
    case chinese
    case italian
    case hamburger
    case pizza
    
    var value: String {
        switch self {
        case .japanese: return "Japanese"
        case .chinese: return "Chinese"
        case .italian: return "Italian"
        case .hamburger: return "Hamburger"
        case .pizza: return "Pizza"
        }
    }
}
