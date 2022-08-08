//
//  MainViewModel.swift
//  Task-Studydrive
//
//  Created by Faraz Ahmed Khan on 08/08/2022.
//

import Foundation

class MainViewModel {
    
    //MARK: - VARIABLES
    var cellCount: Int = 0 {
        didSet {
            print("cell count = \(cellCount)")
            reloadCollectionView?()
        }
    }
    var cells: [Int] = [Int]()
    fileprivate var producerTimer: Timer?
    fileprivate var consumerTimer: Timer?
    
    //MARK: - CALLBACKS
    var reloadCollectionView: (()->Void)?

    //MARK: - METHODS
    func createProducer() {
        producerTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(increaseCellCount), userInfo: nil, repeats: true)
    }
    
    func createConsumer() {
        consumerTimer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(decreaseCellCount), userInfo: nil, repeats: true)
    }
    
    @objc fileprivate func increaseCellCount() {
        cellCount += 1
        cells.append(cellCount)
    }
    
    @objc fileprivate func decreaseCellCount() {
        if cellCount > 0 {
            cellCount -= 1
            cells.removeLast()
        }
    }
}
