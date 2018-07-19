//
//  HomeViewCell.swift
//  RedMartAssignment
//
//  Created by Ankit.G on 10/07/18.
//  Copyright © 2018 Ankit.Gohel. All rights reserved.
//

import UIKit

struct CategoryViewModel {
    var title: String?
    var iconImageData: Data?
}

class CategoryViewCell: UICollectionViewCell {

    // MARK:- Outlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK:- Properties
    var displayModel: CategoryViewModel? {
        didSet {
            labelTitle.text = displayModel?.title
            if let _imgData: Data = displayModel?.iconImageData {
                imgIcon.image = UIImage(data: _imgData)
                self.hideLoadingState()
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

        imgIcon.image = nil
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
