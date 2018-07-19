//
//  Filter.swift
//  Created on July 9, 2018

import Foundation


class Filter : NSObject, NSCoding{

    var options : [Option]!
    var toggles : [Toggle]!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        options = [Option]()
        if let optionsArray = dictionary["options"] as? [[String:Any]]{
            for dic in optionsArray{
                let value = Option(fromDictionary: dic)
                options.append(value)
            }
        }
        toggles = [Toggle]()
        if let togglesArray = dictionary["toggles"] as? [[String:Any]]{
            for dic in togglesArray{
                let value = Toggle(fromDictionary: dic)
                toggles.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if options != nil{
            var dictionaryElements = [[String:Any]]()
            for optionsElement in options {
                dictionaryElements.append(optionsElement.toDictionary())
            }
            dictionary["options"] = dictionaryElements
        }
        if toggles != nil{
            var dictionaryElements = [[String:Any]]()
            for togglesElement in toggles {
                dictionaryElements.append(togglesElement.toDictionary())
            }
            dictionary["toggles"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        options = aDecoder.decodeObject(forKey: "options") as? [Option]
        toggles = aDecoder.decodeObject(forKey: "toggles") as? [Toggle]
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if options != nil{
            aCoder.encode(options, forKey: "options")
        }
        if toggles != nil{
            aCoder.encode(toggles, forKey: "toggles")
        }
    }
}
