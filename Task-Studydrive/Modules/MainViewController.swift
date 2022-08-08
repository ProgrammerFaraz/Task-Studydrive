//
//  MainViewController.swift
//  Task-Studydrive
//
//  Created by Faraz Ahmed Khan on 08/08/2022.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - UI PROPERTIES
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        
        let c = UICollectionView(frame: .zero, collectionViewLayout: layout)
        c.translatesAutoresizingMaskIntoConstraints = false
        c.backgroundColor = .black
        c.delegate = self
        c.dataSource = self
        c.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        return c
    }()
    
    fileprivate lazy var leftButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("left button", for: .normal)
        b.backgroundColor = .lightGray
        b.layer.cornerRadius = 10
        b.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        return b
    }()
    
    fileprivate lazy var rightButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("right button", for: .normal)
        b.backgroundColor = .lightGray
        b.layer.cornerRadius = 10
        b.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        return b
    }()
    
    fileprivate lazy var stackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [leftButton, rightButton])
        s.translatesAutoresizingMaskIntoConstraints = false
        s.heightAnchor.constraint(equalToConstant: 60).isActive = true
        s.axis = .horizontal
        s.alignment = .fill
        s.distribution = .fillEqually
        s.spacing = 10
        return s
    }()
    
    //MARK: - VARIABLES
    
    fileprivate lazy var viewModel: MainViewModel = {
        let vm = MainViewModel()
        vm.reloadCollectionView = { [weak self] in
            self?.collectionView.reloadData()
        }
        return vm
    }()
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }

    //MARK: - METHODS
    fileprivate func setupViews() {
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
    }
    
    //MARK: - UI INTERACTIONS
    @objc fileprivate func leftButtonTapped() {
        print("left button tapped")
        viewModel.createProducer()
        
    }
    
    @objc fileprivate func rightButtonTapped() {
        print("right button tapped")
        viewModel.createConsumer()
    }
}

//MARK: - COLLECTIONVIEW DELEGATE/DATASOURCE
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        cell.configureCell(text: "Cell \(viewModel.cells[indexPath.item])")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width/1.1
        let cellHeight = collectionView.frame.height/4.25
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
