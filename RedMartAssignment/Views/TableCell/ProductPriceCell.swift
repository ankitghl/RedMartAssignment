//
//  ProductPriceCell.swift
//  RedMartAssignment
//
//  Created by Ankit.G on 13/07/18.
//  Copyright © 2018 Ankit.Gohel. All rights reserved.
//

import UIKit

struct PriceCellViewModel {
    var discountedPrice: Float = 0
    var originalPrice: Float = 0
    var discount: Float = 0
}

class ProductPriceCell: UITableViewCell {

    //MARK : - Outlets
    
    @IBOutlet weak var labelDiscountedPrice: UILabel!
    @IBOutlet weak var labelOriginalPrice: UILabel!
    @IBOutlet weak var labelDiscount: UILabel!
    
    //MARK : - Properties
    
    var displayModel: PriceCellViewModel? {
        didSet {
            self.showOnlyRequiredLabel()
            self.setData()
        }
    }

    //MARK : - View Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK : - Helper Methods
    
    private func showOnlyRequiredLabel() {
        if displayModel?.discountedPrice == 0 {
            labelOriginalPrice.isHidden = true
        }
        if displayModel?.discount == 0 {
            labelDiscount.isHidden = true
        }
    }
    
    private func setData() {
        if displayModel?.discountedPrice == 0 {
            labelDiscountedPrice.text = "$\(displayModel?.originalPrice ?? 0)"
            
            if let _value = displayModel?.originalPrice, _value.isZero {
                labelDiscountedPrice.isHidden = true
            }
        } else {
            labelDiscountedPrice.text = "$\(displayModel?.discountedPrice ?? 0)"
            
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "\(displayModel?.originalPrice ?? 0)")
            attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(0, attributeString.length))
            
            labelOriginalPrice.attributedText = attributeString
            
            if let _value = displayModel?.discountedPrice, _value.isZero {
                labelDiscountedPrice.isHidden = true
            }
            if let _value = displayModel?.originalPrice, _value.isZero {
                labelOriginalPrice.isHidden = true
            }
        }
        
        if let _discount = displayModel?.discount, _discount != 0 {
            let cleanDiscount: String = (_discount.truncatingRemainder(dividingBy: 1)  == 0 ? String(format: "%.0f", _discount) : String(_discount))
                
            labelDiscount.text = "\(cleanDiscount)% OFF"
        }
        
    }

}
