//
//  Option.swift
//  Created on July 9, 2018

import Foundation


class Option : NSObject, NSCoding{

    var name : String!
    var types : [Type]!
    var uri : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        name = dictionary["name"] as? String
        uri = dictionary["uri"] as? String
        types = [Type]()
        if let typesArray = dictionary["types"] as? [[String:Any]]{
            for dic in typesArray{
                let value = Type(fromDictionary: dic)
                types.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if name != nil{
            dictionary["name"] = name
        }
        if uri != nil{
            dictionary["uri"] = uri
        }
        if types != nil{
            var dictionaryElements = [[String:Any]]()
            for typesElement in types {
                dictionaryElements.append(typesElement.toDictionary())
            }
            dictionary["types"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        name = aDecoder.decodeObject(forKey: "name") as? String
        types = aDecoder.decodeObject(forKey: "types") as? [Type]
        uri = aDecoder.decodeObject(forKey: "uri") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if types != nil{
            aCoder.encode(types, forKey: "types")
        }
        if uri != nil{
            aCoder.encode(uri, forKey: "uri")
        }
    }
}
