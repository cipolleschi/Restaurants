//
//  RestaurantsCoordinator.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 18/10/21.
//

import UIKit

final class RestaurantsCoordinator {
    private weak var presentingViewController: UIViewController?
    private var dependencies: Dependencies
    
    init(presentingViewController: UIViewController, dependencies: Dependencies) {
        self.presentingViewController = presentingViewController
        self.dependencies = dependencies
    }
    
    func start(restaurants: [Restaurant]) {
        let viewModel = RestaurantsViewModel(restaurants: restaurants)
        let viewController = RestaurantsViewController(viewModel: viewModel)
        self.presentingViewController?.show(viewController, sender: self)
    }
}
