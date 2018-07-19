//
//  ProductViewCell.swift
//  RedMartAssignment
//
//  Created by Ankit.G on 11/07/18.
//  Copyright © 2018 Ankit.Gohel. All rights reserved.
//

import UIKit

struct ProductViewModel {
    var iconImageData: Data?
    var name: String?
    var size: String?
    var price: Float = 0

}

class ProductViewCell: UICollectionViewCell {

    // MARK:- Outlets
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var labelProductSize: UILabel!
    @IBOutlet weak var labelProductPrice: UILabel!
    @IBOutlet weak var buttonAddToCart: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // MARK:- Properties
    var displayModel: ProductViewModel? {
        didSet {
            if let _imgData: Data = displayModel?.iconImageData {
                self.imgProduct.image = UIImage(data: _imgData)
                self.hideLoadingState()
            }

            labelProductName.text = displayModel?.name
            labelProductSize.text = displayModel?.size
            labelProductPrice.text = "$\(displayModel?.price ?? 0)"

            if let _price = displayModel?.price, _price.isZero {
                labelProductPrice.isHidden = true
            }
        }
    }

    // MARK:- View Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imgProduct.image = nil
    }

    // MARK:- Helper Methods
    private func configureView() {
        layer.cornerRadius = 4
        layer.masksToBounds = true
        showLoadingState()
    }

    private func showLoadingState() {
        activityIndicator.startAnimating()
    }
    
    private func hideLoadingState() {
        activityIndicator.stopAnimating()
    }

}
