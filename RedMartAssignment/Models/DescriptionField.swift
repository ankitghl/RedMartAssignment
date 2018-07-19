//
//  DescriptionField.swift
//  Created on July 9, 2018

import Foundation


class DescriptionField : NSObject, NSCoding{

    var primary : [Primary]!
    var secondary : [Primary]!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        primary = [Primary]()
        if let primaryArray = dictionary["primary"] as? [[String:Any]]{
            for dic in primaryArray{
                let value = Primary(fromDictionary: dic)
                primary.append(value)
            }
        }
        secondary = [Primary]()
        if let secondaryArray = dictionary["secondary"] as? [[String:Any]]{
            for dic in secondaryArray{
                let value = Primary(fromDictionary: dic)
                secondary.append(value)
            }
        }

    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if primary != nil{
            var dictionaryElements = [[String:Any]]()
            for primaryElement in primary {
                dictionaryElements.append(primaryElement.toDictionary())
            }
            dictionary["primary"] = dictionaryElements
        }
        if secondary != nil{
            var dictionaryElements = [[String:Any]]()
            for secondaryElement in primary {
                dictionaryElements.append(secondaryElement.toDictionary())
            }
            dictionary["secondary"] = dictionaryElements
        }

        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        primary = aDecoder.decodeObject(forKey: "primary") as? [Primary]
        secondary = aDecoder.decodeObject(forKey: "secondary") as? [Primary]
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if primary != nil{
            aCoder.encode(primary, forKey: "primary")
        }
        if secondary != nil{
            aCoder.encode(secondary, forKey: "secondary")
        }
    }
}
