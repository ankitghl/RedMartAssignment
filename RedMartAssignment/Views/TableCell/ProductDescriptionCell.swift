//
//  ProductDescriptionCell.swift
//  RedMartAssignment
//
//  Created by Ankit.G on 13/07/18.
//  Copyright © 2018 Ankit.Gohel. All rights reserved.
//

import UIKit

struct DescriptionCellViewModel {
    var title: String = ""
    var description: String = ""
}

class ProductDescriptionCell: UITableViewCell {

    //MARK : - Outlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    //MARK : - Properties
    
    var displayModel: DescriptionCellViewModel? {
        didSet {
            labelTitle.text = displayModel?.title
            labelDescription.text = displayModel?.description
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
    
}
