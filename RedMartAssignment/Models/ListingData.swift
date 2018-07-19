//
//  ListingData.swift
//  Created on July 9, 2018

import Foundation


class ListingData : NSObject, NSCoding{

    var facets : Facet!
    var filters : Filter!
    var images : Image!
    var meta : Meta!
    var onSaleCount : Int!
    var page : Int!
    var pageSize : Int!
    var products : [Product]!
    var status : Statu!
    var title : String!
    var total : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        onSaleCount = dictionary["on_sale_count"] as? Int
        page = dictionary["page"] as? Int
        pageSize = dictionary["page_size"] as? Int
        title = dictionary["title"] as? String
        total = dictionary["total"] as? Int
        if let facetsData = dictionary["facets"] as? [String:Any]{
            facets = Facet(fromDictionary: facetsData)
        }
        if let filtersData = dictionary["filters"] as? [String:Any]{
            filters = Filter(fromDictionary: filtersData)
        }
        if let imagesData = dictionary["images"] as? [String:Any]{
            images = Image(fromDictionary: imagesData)
        }
        if let metaData = dictionary["meta"] as? [String:Any]{
            meta = Meta(fromDictionary: metaData)
        }
        if let statusData = dictionary["status"] as? [String:Any]{
            status = Statu(fromDictionary: statusData)
        }
        products = [Product]()
        if let productsArray = dictionary["products"] as? [[String:Any]]{
            for dic in productsArray{
                let value = Product(fromDictionary: dic)
                products.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if onSaleCount != nil{
            dictionary["on_sale_count"] = onSaleCount
        }
        if page != nil{
            dictionary["page"] = page
        }
        if pageSize != nil{
            dictionary["page_size"] = pageSize
        }
        if title != nil{
            dictionary["title"] = title
        }
        if total != nil{
            dictionary["total"] = total
        }
        if facets != nil{
            dictionary["facets"] = facets.toDictionary()
        }
        if filters != nil{
            dictionary["filters"] = filters.toDictionary()
        }
        if images != nil{
            dictionary["images"] = images.toDictionary()
        }
        if meta != nil{
            dictionary["meta"] = meta.toDictionary()
        }
        if status != nil{
            dictionary["status"] = status.toDictionary()
        }
        if products != nil{
            var dictionaryElements = [[String:Any]]()
            for productsElement in products {
                dictionaryElements.append(productsElement.toDictionary())
            }
            dictionary["products"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        facets = aDecoder.decodeObject(forKey: "facets") as? Facet
        filters = aDecoder.decodeObject(forKey: "filters") as? Filter
        images = aDecoder.decodeObject(forKey: "images") as? Image
        meta = aDecoder.decodeObject(forKey: "meta") as? Meta
        onSaleCount = aDecoder.decodeObject(forKey: "on_sale_count") as? Int
        page = aDecoder.decodeObject(forKey: "page") as? Int
        pageSize = aDecoder.decodeObject(forKey: "page_size") as? Int
        products = aDecoder.decodeObject(forKey: "products") as? [Product]
        status = aDecoder.decodeObject(forKey: "status") as? Statu
        title = aDecoder.decodeObject(forKey: "title") as? String
        total = aDecoder.decodeObject(forKey: "total") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if facets != nil{
            aCoder.encode(facets, forKey: "facets")
        }
        if filters != nil{
            aCoder.encode(filters, forKey: "filters")
        }
        if images != nil{
            aCoder.encode(images, forKey: "images")
        }
        if meta != nil{
            aCoder.encode(meta, forKey: "meta")
        }
        if onSaleCount != nil{
            aCoder.encode(onSaleCount, forKey: "on_sale_count")
        }
        if page != nil{
            aCoder.encode(page, forKey: "page")
        }
        if pageSize != nil{
            aCoder.encode(pageSize, forKey: "page_size")
        }
        if products != nil{
            aCoder.encode(products, forKey: "products")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if total != nil{
            aCoder.encode(total, forKey: "total")
        }
    }
}
