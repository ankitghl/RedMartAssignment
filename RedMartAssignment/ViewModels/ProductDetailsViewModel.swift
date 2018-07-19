//
//  ProductDetailsViewModel.swift
//  RedMartAssignment
//
//  Created by Ankit.G on 12/07/18.
//  Copyright © 2018 Ankit.Gohel. All rights reserved.
//

import UIKit

class ProductDetailsViewModel: NSObject {
    // MARK: - Properties
    private var product: Product?
    
    // MARK: - Initilaisers

    init(product: Product) {
        self.product = product
    }
    
    // MARK: - Helper Methods
    
    private func getImageURLs() -> [String] {
        var imageURL: [String] = []
        if let _images: [Image] = product?.images {
            for image in _images {
                let finalURL: String = "\(Constants.AppURL.iconURL)\(image.name ?? "")"
                imageURL.append(finalURL )
            }
        }
        return imageURL
    }
    
    private func generateDescriptionArray() -> [Primary] {
        var descriptionArray: [Primary] = []
        if let _description = product?.descriptionFields,
            let _primaryDetails: [Primary] = _description.primary {
            descriptionArray = descriptionArray + _primaryDetails
        }
        
        if let _description = product?.descriptionFields,
            let _secondaryDetails = _description.secondary {
            descriptionArray = descriptionArray + _secondaryDetails
        }
        return checkEmptyDescription(descriptionArray: descriptionArray)
    }
    
    private func checkEmptyDescription(descriptionArray: [Primary]) -> [Primary] {
        let _descriptionArray = descriptionArray.filter{ !($0.content.isEmpty) }

        return _descriptionArray
    }
    
    // MARK: - Getter Methods

    func getTitle() -> String {
        return product?.title ?? ""
    }
    
    func getDescriptionRowCount() -> Int {
        let descriptionArray: [Primary] = generateDescriptionArray()

        return descriptionArray.count
    }
    
    func getImageCellDetails() -> ImageCellViewModel {
        let imageArray: [String] = getImageURLs()
        let name: String = product?.title ?? ""
        var volume: String = ""
        if let _measure: Measure = product?.measure {
            volume = _measure.wtOrVol ?? ""
        }

        let displayModel: ImageCellViewModel = ImageCellViewModel(imagesURL: imageArray,
                                                      name: name,
                                                      volume: volume)
        return displayModel
    }

    func getPriceCellDetails() -> PriceCellViewModel {
        var discountedPrice: Float =  0
        var originalPrice: Float = 0
        var discount: Float = 0

        if let _pricing: Pricing = product?.pricing {
            discountedPrice = _pricing.promoPrice ?? 0
            originalPrice = _pricing.price ?? 0
            discount = _pricing.savings ?? 0
        }
        
        let displayModel: PriceCellViewModel = PriceCellViewModel(discountedPrice: discountedPrice, originalPrice: originalPrice, discount: discount)

        return displayModel
    }

    func getMessage(buttonTag: Int) -> String {
        var message: String = ""
        if buttonTag == 0 {
            message = "Added to cart."
        } else {
            message = "Saved to list."
        }
        return message
    }

    func getDescriptionCellDetails(index: Int) -> DescriptionCellViewModel {
        let descriptionArray: [Primary] = generateDescriptionArray()
        let descriptionObject: Primary = descriptionArray[index]
        let displayModel: DescriptionCellViewModel = DescriptionCellViewModel(title: descriptionObject.name ?? "", description: descriptionObject.content ?? "")
        return displayModel
    }

}
