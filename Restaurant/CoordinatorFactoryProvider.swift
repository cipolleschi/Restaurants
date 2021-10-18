//
//  Coordinator.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 18/10/21.
//

import UIKit

protocol CoordinatorFactoryProvider {
    func makeCoordinatorFactory<Factory: CoordinatorFactory>(
        for requirements: Factory.R
    ) -> Factory
    
    func rootCoordinator(dependencies: Dependencies) -> Coordinator
    func loadingCoordinator(presentingViewController: UIViewController, dependencies: Dependencies) -> Coordinator
    func restaurantsCoordinator(
        presentingViewController: UIViewController,
        dependencies: Dependencies,
        restaurants: [Restaurant]
    ) -> Coordinator
}

struct LiveCoordinatorFactoryProvider: CoordinatorFactoryProvider {
    func makeCoordinatorFactory<Factory: CoordinatorFactory>(
        for requirements: Factory.R
    ) -> Factory  {
        return Factory()
    }
    
    func rootCoordinator(dependencies: Dependencies) -> Coordinator {
        let requirements = RootRequirements(dependencies: dependencies)
        return RootCoordinatorFactory().makeCoordinator(for: requirements)
    }
    
    func loadingCoordinator(presentingViewController: UIViewController, dependencies: Dependencies) -> Coordinator {
        let requirements = LoadingRequirements(
            presentingViewController: presentingViewController,
            dependencies: dependencies
        )
        return LoadingCoordinatorFactory().makeCoordinator(for: requirements)
    }
    
    func restaurantsCoordinator(
        presentingViewController: UIViewController,
        dependencies: Dependencies,
        restaurants: [Restaurant]
    ) -> Coordinator {
        let requirements = RestaurantsRequirements(
            presentingViewController: presentingViewController,
            dependencies: dependencies,
            restaurants: restaurants
        )
        return RestaurantsCoordinatorFactory().makeCoordinator(for: requirements)
    }
}
