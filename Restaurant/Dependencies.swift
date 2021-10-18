//
//  Dependencies.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 18/10/21.
//

import UIKit

struct Dependencies {
    let window: UIWindow
    let networkService: NetworkService   
    let coordinatorFactoryProvider: CoordinatorFactoryProvider
    
    init(
        window: UIWindow,
        networkService: NetworkService = NetworkService(),
        coordinatorFactoryProvider: CoordinatorFactoryProvider = LiveCoordinatorFactoryProvider()
    ) {
        self.window = window
        self.networkService = networkService
        self.coordinatorFactoryProvider = coordinatorFactoryProvider
    }
}
