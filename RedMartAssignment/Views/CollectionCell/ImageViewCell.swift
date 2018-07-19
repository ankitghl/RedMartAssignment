//
//  ImageViewCell.swift
//  RedMartAssignment
//
//  Created by Ankit.G on 14/07/18.
//  Copyright © 2018 Ankit.Gohel. All rights reserved.
//

import UIKit

struct ImageViewCellViewModel {
    var imageData: Data?
}

class ImageViewCell: UICollectionViewCell {

    //MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
  
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    //MARK : - Properties
    private let cellIdentifier: String = "ImageViewCell"
    
    var displayModel: ImageViewCellViewModel? {
        didSet {
            if let _imageData = displayModel?.imageData {
                imageView.image = UIImage(data: _imageData)
                hideLoadingState()
            }
        }
    }

    //MARK: - View Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        showLoadingState()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
    }

    // MARK:- Helper Methods

    private func showLoadingState() {
        activityIndicator.startAnimating()
    }
    
    private func hideLoadingState() {
        activityIndicator.stopAnimating()
    }

}
