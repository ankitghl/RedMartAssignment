//
//  HomeViewController.swift
//  RedMartAssignment
//
//  Created by Ankit.G on 10/07/18.
//  Copyright © 2018 Ankit.Gohel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, HomeViewModelProtocol {

    //MARK:- Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK:- Private Properties
    private let cellIdentifierForCategory: String = "CategoryViewCell"
    private let cellIdentifierForProduct: String = "ProductViewCell"
    var viewModel: HomeViewModel?
    
    private enum Section: Int {
        case categories = 0
        case products
    }
    
    //MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "RedMart"

        registerCell()
        
        if viewModel == nil {
            viewModel = HomeViewModel(delagate: self, searchString: "")
        }
        fetchAllProducts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Private Helpers
    
    private func registerCell() {
        collectionView.register(UINib(nibName: cellIdentifierForCategory, bundle: nil), forCellWithReuseIdentifier: cellIdentifierForCategory)
        collectionView.register(UINib(nibName: cellIdentifierForProduct, bundle: nil), forCellWithReuseIdentifier: cellIdentifierForProduct)
    }

    private func fetchAllProducts() {
        showLoadingState()
        viewModel?.getListingData()
    }
    
    private func showLoadingState() {
        activityIndicator.startAnimating()
    }

    private func hideLoadingState() {
        activityIndicator.stopAnimating()
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: Constants.AppVariables.appName, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }

    //MARK:- Button Events Methods

    @objc private func addedToCartDidTap() {
        showAlert(message: "Added to cart.")
    }

    //MARK:- Home View Model Protocol Methods

    func didReceiveData() {
        hideLoadingState()
        collectionView.reloadData()
    }
    
    func didFailToReceiveData(message: String) {
        hideLoadingState()
        showAlert(message: message)
    }

    //MARK: - Collection View Datasource & Delegates Methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let sections = viewModel?.getSectionsOfCollection() {
            return sections
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case Section.categories.rawValue:
            if let _items = viewModel?.categories?.count {
                return _items
            }

        case Section.products.rawValue:
            if let _items = viewModel?.products?.count {
                return _items
            }

        default:
            return 0
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case Section.categories.rawValue:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifierForCategory, for: indexPath) as? CategoryViewCell {
                cell.displayModel = viewModel?.getDisplayModelForCategoryCell(index: indexPath.row, withImageData: { (imageData) in
                    cell.displayModel?.iconImageData = imageData
                })
                return cell
            }

        case Section.products.rawValue:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifierForProduct, for: indexPath) as? ProductViewCell {
                cell.displayModel = viewModel?.getDisplayModelForProductCell(index: indexPath.row, withImageData: { (imageData) in
                    cell.displayModel?.iconImageData = imageData
                })
                cell.buttonAddToCart.addTarget(self, action: #selector(addedToCartDidTap), for: .touchUpInside)
                viewModel?.checkAndGetNextProducts(index: indexPath.row)
                return cell
            }

        default:
            return UICollectionViewCell()
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let screenWidth = UIScreen.main.bounds.width

        switch indexPath.section {
        case Section.categories.rawValue:
            let categoryToShowInARow: CGFloat = 4
            let interimSpacing: CGFloat = 10

            let scaleFactor = (screenWidth / categoryToShowInARow) - interimSpacing
            
            return CGSize(width: scaleFactor, height: scaleFactor)

        case Section.products.rawValue:
            let cellHeight: CGFloat = 230
            let productToShowInARow: CGFloat = 3
            let interimSpacing: CGFloat = 10

            let scaleFactor = (screenWidth / productToShowInARow) - interimSpacing
            
            return CGSize(width: scaleFactor, height: cellHeight)

        default:
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case Section.categories.rawValue:
            /*******************************************
             The following code opens same View
             Idea was to open the View and load the API with selected Category URI, but I am getting same response as shown in homepage so commented this code.
             *******************************************/
            
//            if let _category = viewModel?.getCategory(forIndex: indexPath.row) {
//                let storyboard: UIStoryboard = UIStoryboard(name: Constants.StoryboardNames.main, bundle: nil)
//                if let _homeController: HomeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
//                    _homeController.viewModel = viewModel?.initialiseViewModel(for: _homeController, searchString: _category.uri ?? "")
//                    navigationController?.pushViewController(_homeController, animated: true)
//                }
//            }
            break
        case Section.products.rawValue:
            if let _product = viewModel?.getProduct(forIndex: indexPath.row) {
                let storyboard: UIStoryboard = UIStoryboard(name: Constants.StoryboardNames.main, bundle: nil)
                if let _productController: ProductDetailsController = storyboard.instantiateViewController(withIdentifier: "ProductDetailsController") as? ProductDetailsController {
                    _productController.viewModel = viewModel?.getViewModelForProductDetails(product: _product)
                    navigationController?.pushViewController(_productController, animated: true)
                }
            }
            break
        default:
            break
        }

    }
}
