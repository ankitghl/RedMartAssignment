//
//  Type.swift
//  Created on July 9, 2018

import Foundation


class Type : NSObject, NSCoding{

    var count : Int!
    var name : String!
    var uri : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        count = dictionary["count"] as? Int
        name = dictionary["name"] as? String
        uri = dictionary["uri"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if count != nil{
            dictionary["count"] = count
        }
        if name != nil{
            dictionary["name"] = name
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
        count = aDecoder.decodeObject(forKey: "count") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        uri = aDecoder.decodeObject(forKey: "uri") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if count != nil{
            aCoder.encode(count, forKey: "count")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if uri != nil{
            aCoder.encode(uri, forKey: "uri")
        }
    }
}
