//
//  ProductCTACell.swift
//  RedMartAssignment
//
//  Created by Ankit.G on 13/07/18.
//  Copyright © 2018 Ankit.Gohel. All rights reserved.
//

import UIKit

class ProductCTACell: UITableViewCell {

    //MARK : - Outlets

    @IBOutlet weak var buttonAddToCard: UIButton!
    @IBOutlet weak var buttonSaveToList: UIButton!
    
    //MARK : - View Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
