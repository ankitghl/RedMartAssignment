//
//  HomeViewModel.swift
//  RedMartAssignment
//
//  Created by Ankit.G on 10/07/18.
//  Copyright © 2018 Ankit.Gohel. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol: class {
    
    func didReceiveData()
    func didFailToReceiveData(message: String)
}

class HomeViewModel: NSObject {
   
    //MARK:- Properties
    var categories: [Category]? {
        get {
            return getCategories()
        }
    }
    var products: [Product]? {
        get {
            return getProducts()
        }
    }
    
    private var networkWrapper: NetworkWrapper = NetworkWrapper()
   
    private weak var delegate: HomeViewModelProtocol?

    private var searchString: String?

    private var pageNumber: Int = 0
    private let indexForPagination: Int = 6

    private var listingData: ListingData?
    
    private var categoryImages: [Int: Data] = [:]
    private var productImages: [Int: Data] = [:]

    //MARK:- Initialisers
    init(delagate: HomeViewModelProtocol, searchString: String) {
        self.delegate = delagate
        self.searchString = searchString
    }

    //MARK:- Private Helper Methods
    private func getUrl(for searchItem: String) -> String {
        let listingAPI = ListingAPI(searchTerm: searchItem, pageNumber: String(pageNumber))
        return listingAPI.getURL()
    }

    private func getCategories() -> [Category] {
        var categoryArray: [Category] = []
        
        if let _facets = listingData?.facets, let _categories = _facets.categories {
            categoryArray = _categories
        }
        return categoryArray
    }

    private func getProducts() -> [Product] {
        var productArray: [Product] = []
        
        if let _products = listingData?.products {
            productArray = _products
        }
        return productArray
    }
    
    private func getPrice(product: Product) -> Float {
        var price: Float = 0

        if let _price = product.pricing.price {
            if !_price.isZero {
                price = _price
            } else {
                if let _promoPrice = product.pricing.promoPrice {
                    if !_promoPrice.isZero {
                        price = _promoPrice
                    }
                }
            }
        } else {
            if let _promoPrice = product.pricing.promoPrice {
                if !_promoPrice.isZero {
                    price = _promoPrice
                }
            }
        }
        return price
    }
    
    private func getIconURLForCategory(forIndex: Int) -> String {
        var urlString: String = ""
        
        guard let _categories = categories  else {
            return urlString
        }
        
        let _category = _categories[forIndex]
        urlString = "\(Constants.AppURL.iconURL)\(_category.image ?? "")"
        return urlString
    }
    
    private func getIconURLForProduct(forIndex: Int) -> String {
        var urlString: String = ""
        
        guard let _products = products  else {
            return urlString
        }
        
        let _product = _products[forIndex]
        urlString = "\(Constants.AppURL.iconURL)\(_product.img.name ?? "")"
        return urlString
    }

    //MARK:- Getter Methods

    func getCategory(forIndex: Int) -> Category? {
        
        if let _categories = categories {
            return _categories[forIndex]
        }
        return nil
    }

    func getProduct(forIndex: Int) -> Product? {
        
        if let _products = products {
            return _products[forIndex]
        }
        return nil
    }

    func getSectionsOfCollection() -> Int {
        var section: Int = 1
        if let _products = products, _products.count > 0 {
            section = 2
        }
        return section
    }

    func checkAndGetNextProducts(index: Int) {
        if ((getProducts().count - indexForPagination) == index) {
            getListingData()
        }
    }
    
    //MARK: - ViewModel Initialisation
    
    func initialiseViewModel(for viewController: HomeViewController, searchString: String) -> HomeViewModel {
        return HomeViewModel(delagate: viewController, searchString: searchString)
    }

    func getDisplayModelForCategoryCell(index: Int, withImageData: @escaping (Data) -> ()) -> CategoryViewModel {
        var displayModel: CategoryViewModel = CategoryViewModel(title: "", iconImageData: nil)
        if let _category = getCategory(forIndex: index) {
            displayModel.title = _category.name

            if let _imageData = self.categoryImages[index] {
                withImageData(_imageData)
            } else {
                downloadImageForCategory(index: index, onSuccess: { (downloadedImage) in
                    self.categoryImages[index] = downloadedImage
                    withImageData(downloadedImage)
                })
            }
        }
        return displayModel
    }
    
    func getDisplayModelForProductCell(index: Int, withImageData: @escaping (Data) -> ()) -> ProductViewModel {
        var displayModel: ProductViewModel = ProductViewModel(iconImageData: nil, name: "", size: "", price: 0)
        if let _product = getProduct(forIndex: index) {
            displayModel.name = _product.title ?? ""
            displayModel.size = _product.measure.wtOrVol ?? ""
            displayModel.price = getPrice(product: _product)

            if let _imageData = self.productImages[index] {
                withImageData(_imageData)
            } else {
                downloadImageForProduct(index: index, onSuccess: { (downloadedImage) in
                    self.productImages[index] = downloadedImage
                    withImageData(downloadedImage)
                })
            }
        }
        return displayModel
    }

    func getViewModelForProductDetails(product: Product) -> ProductDetailsViewModel {
        return ProductDetailsViewModel(product: product)
    }
    
    //MARK:- API Calls
    func getListingData() {
        guard let _searchString = searchString else {
            return
        }
        
        networkWrapper.callAPI(with: getUrl(for: _searchString),
                                onSuccess: { (response) in
                                    if let _response = response as? [String : Any] {
                                        
                                        let _listingData = ListingData(fromDictionary: _response)

                                        if _listingData.status.code == 0 {
                                            if let _products = self.listingData?.products, _products.count > 0 {
                                                self.listingData?.products.insert(contentsOf: _listingData.products, at: _products.count - 1)
                                            } else {
                                                self.listingData = _listingData
                                            }
                                            self.pageNumber = self.pageNumber + 1
                                            self.delegate?.didReceiveData()
                                        } else {
                                            self.delegate?.didFailToReceiveData(message: _listingData.status.msg ?? "")
                                        }
                                    } else {
                                        self.delegate?.didFailToReceiveData(message: Constants.AppVariables.jsonError)

                                    }
                                    
        }, onFailure: { (errorMessage) in
            self.delegate?.didFailToReceiveData(message: Constants.AppVariables.apiError)
        })
    }
    
    private func downloadImageForCategory(index: Int, onSuccess:@escaping (Data)->() ) {
        networkWrapper.downloadImage(urlstring: getIconURLForCategory(forIndex: index), onSuccess: { (responseImageData) in
            onSuccess(responseImageData)
        }, onFailure: { (errorMessage) in
            
        })
    }
    
    private func downloadImageForProduct(index: Int, onSuccess:@escaping (Data)->() ) {
        networkWrapper.downloadImage(urlstring: getIconURLForProduct(forIndex: index), onSuccess: { (responseImageData) in
            onSuccess(responseImageData)
        }, onFailure: { (errorMessage) in
            
        })
    }

}
