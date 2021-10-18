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
    
    init(
        window: UIWindow,
        networkService: NetworkService = NetworkService()
    ) {
        self.window = window
        self.networkService = networkService
    }
}
