//
//  RestaurantsCoordinator.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 18/10/21.
//

import UIKit

public struct RestaurantsRequirements: Requirements {
    let presentingViewController: UIViewController?
    let dependencies: Dependencies
    let restaurants: [Restaurant]
}

private final class RestaurantsCoordinator {
    private weak var presentingViewController: UIViewController?
    private let dependencies: Dependencies
    private let restaurants: [Restaurant]
    
    fileprivate init(
        requirements: RestaurantsRequirements
    ) {
        self.presentingViewController = requirements.presentingViewController
        self.dependencies = requirements.dependencies
        self.restaurants = requirements.restaurants
    }
    
    func start() {
        let viewModel = RestaurantsViewModel(restaurants: restaurants)
        let viewController = RestaurantsViewController(viewModel: viewModel)
        self.presentingViewController?.show(viewController, sender: self)
    }
}

extension RestaurantsCoordinator: Coordinator {}

public struct RestaurantsCoordinatorFactory: CoordinatorFactory {
    func makeCoordinator(for requirements: RestaurantsRequirements) -> Coordinator {
        return RestaurantsCoordinator(requirements: requirements)
    }
}
