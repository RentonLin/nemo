//
//  MainViewController.swift
//  nemo
//
//  Created by Andyy Hope on 21/7/18.
//  Copyright © 2018 Andyy Hope. All rights reserved.
//

import UIKit

extension MainViewController {
//    typealias Section = DataSource.Section
    typealias DataSource = MainViewDataSource
    typealias Model = MainViewModel
}

final class MainViewController: UIViewController, ErrorPresenting {
    
    // MARK: - Properties
    
    private var dataSource: DataSource = DataSource()
    private var tableView: UITableView = UITableView()
    
    // MARK: - Computed Properties
    
    private var model: Model {
        return dataSource.model
    }
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTableView()
        
        dataSource.request(.initial) { [weak self] result in
            switch result {
            case .loading:
                break
            case .completed:
                self?.tableView.reloadData()
            case .failed(let failure):
                self?.presentError(withMessage: failure.description)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
    // MARK: - Preparation
    
    private func prepareTableView() {
        view = tableView

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TextCell.self)
        tableView.register(DetailCell.self)
        tableView.register(ImageCell.self)
        tableView.register(CarouselCell.self)
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    // MARK: Data
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DataSource.SectionController.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch dataSource.sectionController(forIndex: section) {
        case .content(let cellControllers):
            return cellControllers.count
        case .footer(let cellControllers):
            return cellControllers.count
        }
    }
    
    
    // MARK: Titles
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
        
//        switch dataSource.section(forIndex: section) {
//        case .<#section#>:
//            return <#Header title#>
//        }
    }

    
    // MARK: Cells
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dataSource.cellController(for: indexPath) {
        case .text(let cellController):
            let cell: TextCell = tableView.dequeueReusableCell(for: indexPath)
            cellController.prepare(cell)
            return cell
            
        case .detail(let cellController):
            let cell: DetailCell = tableView.dequeueReusableCell(for: indexPath)
            cellController.prepare(cell)
            return cell
            
        case .image(let cellController):
            let cell: ImageCell = tableView.dequeueReusableCell(for: indexPath)
            cellController.prepare(cell)
            return cell
            
        case .carousel(let cellController):
            let cell: CarouselCell = tableView.dequeueReusableCell(for: indexPath)
            cellController.prepare(cell)
            return cell
            
        default:
            fatalError("Invalid Cell passed into: \(String(describing:self))")
        }
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    // MARK: Height
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch dataSource.cellController(for: indexPath) {
        case .text:
            return TextCell.defaultHeight
        case .detail:
            return DetailCell.defaultHeight
        case .image:
            return ImageCell.defaultHeight
        case .carousel:
            return CarouselCell.defaultHeight
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
        
//        switch dataSource.section(forIndex: section) {
//        case .<#section#>:
//            return <#Header height#>
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
        
//        switch dataSource.section(forIndex: section) {
//        case .<#section#>:
//            return <#Footer height#>
//        }
    }
    
    
    // MARK: View
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
        
//        switch dataSource.section(forIndex: section) {
//        case .<#section#>:
//            return <#Header view#>
//        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
        
//        switch dataSource.section(forIndex: section) {
//        case .<#section#>:
//            return <#Footer view#>
//        }
    }
    
    
    // MARK: Selection
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch dataSource.cellController(for: indexPath) {
//        case .text(let cellController):
//            
//        case .detail(let cellController):
//            if let destination = cellController.destination {
//                
//            }
//        case .image(let cellController):
//            if let destination = cellController.destination {
//                
//            }
//
//        default:
//            return
//        }
    }
}