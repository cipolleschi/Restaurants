//
//  RootViewModel.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 17/10/21.
//

import Foundation

class RootViewModel {
    let restaurantTypes: [RestaurantType] = RestaurantType.allCases
    let distances: [Distance] = Distance.allCases
    var currentType: RestaurantType? = nil
    var currentDistance: Distance? = nil
    var veganOnly: Bool = false
    let rootCoordinator: RootCoordinator
    weak var networkService: NetworkService?
    
    init(
        rootCoordinator: RootCoordinator,
        networkService: NetworkService
    ) {
        self.rootCoordinator = rootCoordinator
        self.networkService = networkService
    }
    
    func search() {
        self.rootCoordinator.showLoading()
        self.networkService?.searchRestaurants { [weak self] restaurants in
            self?.rootCoordinator.dismissLoading()
            self?.rootCoordinator.showRestaurants(restaurants)
        }
    }
}
