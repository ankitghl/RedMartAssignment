//
//  ListingAPI.swift
//  RedMartAssignment
//
//  Created by Ankit.G on 09/07/18.
//  Copyright © 2018 Ankit.Gohel. All rights reserved.
//

import Foundation

struct ListingAPI {
    
    private let baseURL = "\(Constants.AppURL.apiURL)"

    private var searchTerm: String = "theme=all-sales"
    private var pageSize: String = Constants.AppURLVariables.pageCount
    private var pageNumber: String = ""
    
    init(searchTerm: String, pageNumber: String) {
        if !searchTerm.isEmpty {
            self.searchTerm = searchTerm
        }
        self.pageNumber = pageNumber
    }
    
    func getURL() -> String {
        let urlString: String = "\(baseURL)\(searchTerm)&pageSize=\(pageSize)&page=\(pageNumber)"
        return urlString
    }
}
