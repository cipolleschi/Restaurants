//
//  ViewController.swift
//  Restaurant
//
//  Created by Riccardo Cipolleschi on 17/10/21.
//

import UIKit


class RootViewController: UIViewController {
    
    private var viewModel: RootViewModel
    
    private var typeLabel = UILabel()
    private var typePicker = UIPickerView()
    private var distanceLabel = UILabel()
    private var distancePicker = UIPickerView()
    private var veganLabel = UILabel()
    private var veganSwitch = UISwitch()
    private var searchButton = UIButton()
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setupUI()
        self.style()
        self.setupConstriants()
        self.setupNavigation()
    }
}

extension RootViewController {
    func setupUI() {
        self.view.addSubview(self.typeLabel)
        self.view.addSubview(self.typePicker)
        self.typePicker.delegate = self
        self.typePicker.dataSource = self
        
        self.view.addSubview(self.distanceLabel)
        self.view.addSubview(self.distancePicker)
        self.distancePicker.delegate = self
        self.distancePicker.dataSource = self
        
        self.view.addSubview(self.veganLabel)
        self.view.addSubview(self.veganSwitch)
        self.view.addSubview(self.searchButton)
        
        self.searchButton.addTarget(self, action: #selector(self.searchTapped), for: .touchUpInside)
    }
    
    @objc func searchTapped(_ button: UIButton) {
        self.viewModel.search()
    }
    
    func style() {
        self.view.backgroundColor = .systemBackground
        self.style(typeLabel, text: "Choose your type of food:")
        self.style(distanceLabel, text: "How far should it be?")
        self.style(veganLabel, text: "Do you want vegan option only?")
        
        self.searchButton.setTitle("Search", for: .normal)
        self.searchButton.setTitleColor(.systemBlue, for: .normal)
        self.searchButton.setTitleColor(.systemBlue.withAlphaComponent(0.7), for: .highlighted)
    }
    
    func setupConstriants() {
        self.typeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.typePicker.translatesAutoresizingMaskIntoConstraints = false
        self.distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.distancePicker.translatesAutoresizingMaskIntoConstraints  = false
        self.veganLabel.translatesAutoresizingMaskIntoConstraints = false
        self.veganSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.typeLabel.leadingAnchor.constraint(equalTo: self.view.readableContentGuide.leadingAnchor),
            self.typeLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            self.typePicker.leadingAnchor.constraint(equalTo: self.view.readableContentGuide.leadingAnchor),
            self.typePicker.trailingAnchor.constraint(equalTo: self.view.readableContentGuide.trailingAnchor),
            self.typePicker.topAnchor.constraint(equalTo: self.typeLabel.bottomAnchor),
            self.typePicker.heightAnchor.constraint(equalToConstant: 100),
            
            self.distanceLabel.leadingAnchor.constraint(equalTo: self.view.readableContentGuide.leadingAnchor),
            self.distanceLabel.topAnchor.constraint(equalTo: self.typePicker.bottomAnchor),
            
            self.distancePicker.leadingAnchor.constraint(equalTo: self.view.readableContentGuide.leadingAnchor),
            self.distancePicker.trailingAnchor.constraint(equalTo: self.view.readableContentGuide.trailingAnchor),
            self.distancePicker.topAnchor.constraint(equalTo: self.distanceLabel.bottomAnchor, constant: 20),
            self.distancePicker.heightAnchor.constraint(equalToConstant: 100),
            
            self.veganLabel.leadingAnchor.constraint(equalTo: self.view.readableContentGuide.leadingAnchor),
            self.veganLabel.topAnchor.constraint(equalTo: self.distancePicker.bottomAnchor, constant: 20),
            
            self.veganSwitch.trailingAnchor.constraint(equalTo: self.view.readableContentGuide.trailingAnchor),
            self.veganSwitch.centerYAnchor.constraint(equalTo: self.veganLabel.centerYAnchor),
            
            self.searchButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -40),
            self.searchButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.searchButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupNavigation() {
        self.navigationItem.title = "Search"
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension RootViewController {
    func style(_ label: UILabel, text: String) {
        label.text = text
    }
}

extension RootViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == self.typePicker {
            return self.viewModel.restaurantTypes[row].value
        }
        
        if pickerView == self.distancePicker {
            return self.viewModel.distances[row].value
        }
        
        return ""
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 25
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.bounds.width
    }
}

extension RootViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == typePicker {
            return self.viewModel.restaurantTypes.count
        }
        
        if pickerView == distancePicker {
            return self.viewModel.distances.count
        }
        
        return 0
    }
}
