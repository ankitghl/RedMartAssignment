//
//  ProductDetailsController.swift
//  RedMartAssignment
//
//  Created by Ankit.G on 12/07/18.
//  Copyright © 2018 Ankit.Gohel. All rights reserved.
//

import UIKit

class ProductDetailsController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK : - Properties
    var viewModel: ProductDetailsViewModel?
    
    private struct TableViewDetails {
        enum cellIndex: Int {
            case imageCell = 0
            case priceCell
            case ctaCell
            case descriptionCell
        }
        
        struct CellIdentifiers {
            static let imageCell = "ProductImageCell"
            static let priceCell = "ProductPriceCell"
            static let ctaCell = "ProductCTACell"
            static let descriptionCell = "ProductDescriptionCell"
        }
    }
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        registerCell()
        title = viewModel?.getTitle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Helper Methods

    private func registerCell() {
        let tableViewIdentifier = TableViewDetails.CellIdentifiers.self
        
        tableView.register(UINib(nibName: tableViewIdentifier.imageCell, bundle: nil), forCellReuseIdentifier: tableViewIdentifier.imageCell)
        tableView.register(UINib(nibName: tableViewIdentifier.priceCell, bundle: nil), forCellReuseIdentifier: tableViewIdentifier.priceCell)
        tableView.register(UINib(nibName: tableViewIdentifier.ctaCell, bundle: nil), forCellReuseIdentifier: tableViewIdentifier.ctaCell)
        tableView.register(UINib(nibName: tableViewIdentifier.descriptionCell, bundle: nil), forCellReuseIdentifier: tableViewIdentifier.descriptionCell)
    }
    
    @objc private func showAlert(button: UIButton) {
        let message: String = (viewModel?.getMessage(buttonTag: button.tag))!
        let alert = UIAlertController(title: Constants.AppVariables.appName, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
    //MARK: - Table View Datasource & Delegate Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let tableViewIndices = TableViewDetails.cellIndex.self
        
        switch section {
        case tableViewIndices.imageCell.rawValue:
            return 1
            
        case tableViewIndices.priceCell.rawValue:
            return 1
            
        case tableViewIndices.ctaCell.rawValue:
            return 1
            
        case tableViewIndices.descriptionCell.rawValue:
            return (viewModel?.getDescriptionRowCount())!
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewIndices = TableViewDetails.cellIndex.self
        let tableViewIdentifier = TableViewDetails.CellIdentifiers.self

        switch indexPath.section {
        case tableViewIndices.imageCell.rawValue:
            if let cell: ProductImageCell = tableView.dequeueReusableCell(withIdentifier: tableViewIdentifier.imageCell, for: indexPath) as? ProductImageCell {
                cell.displayModel = viewModel?.getImageCellDetails()
                return cell
            }
            
        case tableViewIndices.priceCell.rawValue:
            if let cell: ProductPriceCell = tableView.dequeueReusableCell(withIdentifier: tableViewIdentifier.priceCell, for: indexPath) as? ProductPriceCell {
                cell.displayModel = viewModel?.getPriceCellDetails()
                return cell
            }
            
        case tableViewIndices.ctaCell.rawValue:
            if let cell: ProductCTACell = tableView.dequeueReusableCell(withIdentifier: tableViewIdentifier.ctaCell, for: indexPath) as? ProductCTACell {
                cell.buttonAddToCard.addTarget(self, action: #selector(showAlert(button:)), for: .touchUpInside)
                cell.buttonSaveToList.addTarget(self, action: #selector(showAlert(button:)), for: .touchUpInside)
                return cell
            }
            
        case tableViewIndices.descriptionCell.rawValue:
            if let cell: ProductDescriptionCell = tableView.dequeueReusableCell(withIdentifier: tableViewIdentifier.descriptionCell, for: indexPath) as? ProductDescriptionCell {
                cell.displayModel = viewModel?.getDescriptionCellDetails(index: indexPath.row)
                return cell
            }
            
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableViewIndices = TableViewDetails.cellIndex.self

        switch indexPath.section {
        case tableViewIndices.imageCell.rawValue:
            return 254

        case tableViewIndices.priceCell.rawValue:
            return 44

        case tableViewIndices.ctaCell.rawValue:
            return 80

        case tableViewIndices.descriptionCell.rawValue:
            return UITableViewAutomaticDimension

        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
