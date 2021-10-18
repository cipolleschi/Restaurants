//
//  NetworkService.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 18/10/21.
//

import Foundation

class NetworkService {
    func searchRestaurants(callback: @escaping ([Restaurant]) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) {
            let restaurants = (0..<Int.random(in: 6..<20)).map { value in
                return Restaurant(name: "Restaurant \(value)", distance: Double.random(in: 6..<20))
            }
            callback(restaurants)
        }
    }
}
