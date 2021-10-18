//
//  Distance.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 17/10/21.
//

import Foundation

enum Distance: CaseIterable {
    case lessThan1Km
    case oneAndFiveKm
    case fiveAndTenKm
    case moreThanTenKm
    
    var value: String {
        switch self {
        case .lessThan1Km: return  "< 1 Km"
        case .oneAndFiveKm: return  "1 <= Km < 5"
        case .fiveAndTenKm: return  "5 <= Km < 10"
        case .moreThanTenKm: return  ">= 10 Km"
        }
    }
}
