//
//  Detail.swift
//  Created on July 9, 2018

import Foundation


class Detail : NSObject, NSCoding{

    var countryOfOrigin : String!
    var isNew : Int!
    var prodType : Int!
    var status : Int!
    var storageClass : String!
    var uri : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        countryOfOrigin = dictionary["country_of_origin"] as? String
        isNew = dictionary["is_new"] as? Int
        prodType = dictionary["prod_type"] as? Int
        status = dictionary["status"] as? Int
        storageClass = dictionary["storage_class"] as? String
        uri = dictionary["uri"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if countryOfOrigin != nil{
            dictionary["country_of_origin"] = countryOfOrigin
        }
        if isNew != nil{
            dictionary["is_new"] = isNew
        }
        if prodType != nil{
            dictionary["prod_type"] = prodType
        }
        if status != nil{
            dictionary["status"] = status
        }
        if storageClass != nil{
            dictionary["storage_class"] = storageClass
        }
        if uri != nil{
            dictionary["uri"] = uri
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        countryOfOrigin = aDecoder.decodeObject(forKey: "country_of_origin") as? String
        isNew = aDecoder.decodeObject(forKey: "is_new") as? Int
        prodType = aDecoder.decodeObject(forKey: "prod_type") as? Int
        status = aDecoder.decodeObject(forKey: "status") as? Int
        storageClass = aDecoder.decodeObject(forKey: "storage_class") as? String
        uri = aDecoder.decodeObject(forKey: "uri") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if countryOfOrigin != nil{
            aCoder.encode(countryOfOrigin, forKey: "country_of_origin")
        }
        if isNew != nil{
            aCoder.encode(isNew, forKey: "is_new")
        }
        if prodType != nil{
            aCoder.encode(prodType, forKey: "prod_type")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if storageClass != nil{
            aCoder.encode(storageClass, forKey: "storage_class")
        }
        if uri != nil{
            aCoder.encode(uri, forKey: "uri")
        }
    }
}
