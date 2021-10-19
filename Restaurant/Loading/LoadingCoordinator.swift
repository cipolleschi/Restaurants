//
//  LoadingCoordinator.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 18/10/21.
//

import UIKit

public struct LoadingRequirements: Requirements {
    let presentingViewController: UIViewController
    let dependencies: Dependencies
}

private final class LoadingCoordinator {
    private weak var presentingViewController: UIViewController?
    private let dependencies: Dependencies
    
    fileprivate init(requirements: LoadingRequirements) {
        self.presentingViewController = requirements.presentingViewController
        self.dependencies = requirements.dependencies
    }
    
    func start() {
        let loadingViewController = LoadingViewController()
        loadingViewController.modalPresentationStyle = .overFullScreen
        loadingViewController.modalTransitionStyle = .crossDissolve
        self.presentingViewController?.present(loadingViewController, animated: true, completion: nil)
    }
    
}

extension LoadingCoordinator: Coordinator {}

public struct LoadingCoordinatorFactory: CoordinatorFactory {
    func makeCoordinator(for requirements: LoadingRequirements) -> Coordinator {
        return LoadingCoordinator(requirements: requirements)
    }
}
