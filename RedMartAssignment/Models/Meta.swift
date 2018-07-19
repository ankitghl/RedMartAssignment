//
//  Meta.swift
//  Created on July 9, 2018

import Foundation


class Meta : NSObject, NSCoding{

    var desc : String!
    var keywords : String!
    var title : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        desc = dictionary["desc"] as? String
        keywords = dictionary["keywords"] as? String
        title = dictionary["title"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if desc != nil{
            dictionary["desc"] = desc
        }
        if keywords != nil{
            dictionary["keywords"] = keywords
        }
        if title != nil{
            dictionary["title"] = title
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        desc = aDecoder.decodeObject(forKey: "desc") as? String
        keywords = aDecoder.decodeObject(forKey: "keywords") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if desc != nil{
            aCoder.encode(desc, forKey: "desc")
        }
        if keywords != nil{
            aCoder.encode(keywords, forKey: "keywords")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
    }
}
