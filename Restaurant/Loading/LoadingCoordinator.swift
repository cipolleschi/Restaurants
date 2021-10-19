//
//  LoadingCoordinator.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 18/10/21.
//

import UIKit

final class LoadingCoordinator {
    private weak var presentingViewController: UIViewController?
    private let dependencies: Dependencies
    
    init(presentingViewController: UIViewController, dependencies: Dependencies) {
        self.presentingViewController = presentingViewController
        self.dependencies = dependencies
    }
    
    func start() {
        let loadingViewController = LoadingViewController()
        loadingViewController.modalPresentationStyle = .overFullScreen
        loadingViewController.modalTransitionStyle = .crossDissolve
        self.presentingViewController?.present(loadingViewController, animated: true, completion: nil)
    }
    
}
