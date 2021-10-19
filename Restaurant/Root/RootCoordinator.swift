//
//  RootCoordinator.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 18/10/21.
//

import Foundation
import UIKit

public struct RootRequirements: Requirements {
    let dependencies: Dependencies
}

class RootCoordinator {
    private let dependencies: Dependencies
    
    private var presentingViewController: UIViewController? {
        return self.dependencies.window.rootViewController
    }
    
    fileprivate init(requirements: RootRequirements) {
        self.dependencies = requirements.dependencies
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
        
        self.dependencies.coordinatorFactoryProvider
            .loadingCoordinator(presentingViewController: presentingViewController, dependencies: dependencies)
            .start()
    }
    
    func dismissLoading() {
        DispatchQueue.main.async {
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    func showRestaurants(_ restaurants: [Restaurant]) {
        DispatchQueue.main.async { [weak self] in
            
            guard
                let self = self,
                let presentingViewController = self.presentingViewController else {
                return
            }
            
            self.dependencies.coordinatorFactoryProvider
                .restaurantsCoordinator(
                    presentingViewController: presentingViewController,
                    dependencies: self.dependencies,
                    restaurants: restaurants
                )
                .start()
        }
    }
}

extension RootCoordinator: Coordinator {}

struct RootCoordinatorFactory: CoordinatorFactory {
    func makeCoordinator(for requirements: RootRequirements) -> Coordinator {
        return RootCoordinator(requirements: requirements)
    }
}
