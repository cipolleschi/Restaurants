//
//  RestaurantsViewController.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 18/10/21.
//

import UIKit

final class RestaurantsViewModel {
    let restaurants: [Restaurant]
    
    init(restaurants: [Restaurant]) {
        self.restaurants = restaurants
    }
}

final class RestaurantCell: UITableViewCell {
    static let reuseIdentifier = "\(RestaurantCell.self)"
    private let image = UIImageView()
    private let name = UILabel()
    private let distance = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setup()
        self.style()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    func setup() {
        self.contentView.addSubview(self.image)
        self.contentView.addSubview(self.name)
        self.contentView.addSubview(self.distance)
    }
    
    func style() {
        self.contentView.backgroundColor = .systemBackground
        
        self.image.backgroundColor = .systemBlue
    }
    
    func setupConstraints() {
        self.image.translatesAutoresizingMaskIntoConstraints = false
        self.name.translatesAutoresizingMaskIntoConstraints = false
        self.distance.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.image.leadingAnchor.constraint(equalTo: self.contentView.readableContentGuide.leadingAnchor),
            self.image.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.image.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, constant: -20),
            self.image.widthAnchor.constraint(equalTo: self.image.heightAnchor),
            
            self.name.leadingAnchor.constraint(equalTo: self.image.trailingAnchor, constant: 10),
            self.name.bottomAnchor.constraint(equalTo: self.image.centerYAnchor),
            
            self.distance.leadingAnchor.constraint(equalTo: self.name.leadingAnchor),
            self.distance.topAnchor.constraint(equalTo: self.name.bottomAnchor)
        ])
    }
    
    func configure(with restaurant: Restaurant) {
        self.name.text = restaurant.name
        self.distance.text = restaurant.distanceDescription
        
        self.setNeedsUpdateConstraints()
    }
}

final class RestaurantsViewController: UITableViewController {
    let viewModel: RestaurantsViewModel
    
    init(viewModel: RestaurantsViewModel) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        self.setupNavigation()
    }
    
    func setupTableView() {
        self.tableView.allowsSelection = false
        self.tableView.register(RestaurantCell.self, forCellReuseIdentifier: RestaurantCell.reuseIdentifier)
    }
    
    func setupNavigation() {
        self.navigationItem.title = "Restaurants"
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantCell.reuseIdentifier) as! RestaurantCell
        cell.configure(with: self.viewModel.restaurants[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension Restaurant {
    var distanceDescription: String {
        return String(format: "%.2f Km", self.distance)
    }
}
