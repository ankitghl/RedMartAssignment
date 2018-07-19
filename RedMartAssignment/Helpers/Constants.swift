//
//  Constants.swift
//  RedMartAssignment
//
//  Created by Ankit.G on 09/07/18.
//  Copyright © 2018 Ankit.Gohel. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    struct AppVariables {
        static let appName: String = "RedMartAssignment"
        static let apiError: String = "Oops! Something went wrong."
        static let jsonError: String = "Oops! Something went wrong."
    }

    struct AppURL {
        static let apiURL: String = "https://api.redmart.com/v1.6.0/catalog/search?"
        static let iconURL: String = "http://media.redmart.com/newmedia/200p"
    }
    
    struct AppTheme {
        static let appThemeColor: UIColor = UIColor(red: 234/255, green: 66/255, blue: 87/255, alpha: 1)
    }
    
    struct AppURLVariables {
        static let pageCount: String = "30"
    }

    struct StoryboardNames {
        static let main: String = "Main"
    }
}



