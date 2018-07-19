//
//  Image.swift
//  Created on July 13, 2018

import Foundation


class Image : NSObject, NSCoding{
    
    var h : Int!
    var name : String!
    var position : Int!
    var w : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        h = dictionary["h"] as? Int
        name = dictionary["name"] as? String
        position = dictionary["position"] as? Int
        w = dictionary["w"] as? Int
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if h != nil{
            dictionary["h"] = h
        }
        if name != nil{
            dictionary["name"] = name
        }
        if position != nil{
            dictionary["position"] = position
        }
        if w != nil{
            dictionary["w"] = w
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        h = aDecoder.decodeObject(forKey: "h") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        position = aDecoder.decodeObject(forKey: "position") as? Int
        w = aDecoder.decodeObject(forKey: "w") as? Int
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if h != nil{
            aCoder.encode(h, forKey: "h")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if position != nil{
            aCoder.encode(position, forKey: "position")
        }
        if w != nil{
            aCoder.encode(w, forKey: "w")
        }
    }
}
