//
//  RootCoordinator.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 18/10/21.
//

import Foundation
import UIKit

class RootCoordinator {
    private let dependencies: Dependencies
    
    private var presentingViewController: UIViewController? {
        return self.dependencies.window.rootViewController
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func start() {
        let viewModel = RootViewModel(rootCoordinator: self, networkService: self.dependencies.networkService)
        let viewController = RootViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        self.dependencies.window.rootViewController = navigationController
    }
    
    func showLoading() {
        guard let presentingViewController = self.presentingViewController else {
            return
        }
        let loadingCoordinator = LoadingCoordinator(
            presentingViewController: presentingViewController,
            dependencies: self.dependencies
        )
        loadingCoordinator.start()
    }
    
    func dismissLoading() {
        DispatchQueue.main.async {
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    func showRestaurants(_ restaurants: [Restaurant]) {
        DispatchQueue.main.async {
            guard let presentingViewController = self.presentingViewController else {
                return
            }
            
            let restaurantsCoordinator = RestaurantsCoordinator(
                presentingViewController: presentingViewController,
                dependencies: self.dependencies,
                restaurants: restaurants
            )
            restaurantsCoordinator.start()
        }
    }
}
