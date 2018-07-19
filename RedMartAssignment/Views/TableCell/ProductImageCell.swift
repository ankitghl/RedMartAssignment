//
//  ProductImageCell.swift
//  RedMartAssignment
//
//  Created by Ankit.G on 13/07/18.
//  Copyright © 2018 Ankit.Gohel. All rights reserved.
//

import UIKit

struct ImageCellViewModel {
    var imagesURL:[String] = []
    var name: String = ""
    var volume: String = ""
    
    //MARK : - Helper Methods
    
    func downloadImageForProduct(index: Int, onSuccess:@escaping (Data)->() ) {
        let networkWrapper = NetworkWrapper()
        networkWrapper.downloadImage(urlstring: (imagesURL[index]), onSuccess: { (responseImageData) in
            onSuccess(responseImageData)
            
        }, onFailure: { (errorMessage) in
            
        })
    }

}

class ProductImageCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //MARK : - Outlets

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelVolume: UILabel!
    
    //MARK : - Properties
    private let cellIdentifier: String = "ImageViewCell"
    
    var displayModel: ImageCellViewModel? {
        didSet {
            labelName.text = displayModel?.name
            labelVolume.text = displayModel?.volume
            
            pageController.currentPage = 0
            pageController.numberOfPages = (displayModel?.imagesURL.count)!
            pageController.hidesForSinglePage = true

            collectionView.reloadData()
        }
    }
    
    //MARK : - View Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK : - Collection Datasource and Delegate Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (displayModel?.imagesURL.count)!
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: ImageViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ImageViewCell {
            displayModel?.downloadImageForProduct(index: indexPath.row) { (receivedData) in
                cell.displayModel = ImageViewCellViewModel(imageData: receivedData)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    //MARK : - ScrollView Delegate Methods

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
