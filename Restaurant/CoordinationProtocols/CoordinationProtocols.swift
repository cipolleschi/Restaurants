//
//  CoordinationProtocols.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 18/10/21.
//

import Foundation

protocol Coordinator {
    func start()
}

protocol Requirements {}

protocol CoordinatorFactory {
    associatedtype R: Requirements
    
    init()
    func makeCoordinator(for requirement: R) -> Coordinator
}
