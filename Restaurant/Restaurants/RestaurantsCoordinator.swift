//
//  RestaurantsCoordinator.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 18/10/21.
//

import UIKit

final class RestaurantsCoordinator {
    private weak var presentingViewController: UIViewController?
    private let dependencies: Dependencies
    private let restaurants: [Restaurant]
    
    init(presentingViewController: UIViewController, dependencies: Dependencies, restaurants: [Restaurant]) {
        self.presentingViewController = presentingViewController
        self.dependencies = dependencies
        self.restaurants = restaurants
    }
    
    func start() {
        let viewModel = RestaurantsViewModel(restaurants: restaurants)
        let viewController = RestaurantsViewController(viewModel: viewModel)
        self.presentingViewController?.show(viewController, sender: self)
    }
}
