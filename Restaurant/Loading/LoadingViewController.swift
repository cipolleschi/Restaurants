//
//  LoadingViewController.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 18/10/21.
//

import UIKit

final class LoadingViewController: UIViewController {
    
    private var progressView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.style()
        self.setupConstraints()
    }
    
    func setupUI() {
        self.view.addSubview(self.progressView)
    }
    
    func style() {
        self.view.backgroundColor = .black.withAlphaComponent(0.3)
        self.progressView.color = .systemBlue
        self.progressView.startAnimating()
    }
    
    func setupConstraints() {
        self.progressView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.progressView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.progressView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.progressView.widthAnchor.constraint(equalToConstant: 100),
            self.progressView.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        self.progressView.transform = .identity.scaledBy(x: 2.0, y: 2.0)
    }
    
}
