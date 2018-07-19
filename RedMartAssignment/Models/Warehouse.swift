//
//  Warehouse.swift
//  Created on July 9, 2018

import Foundation


class Warehouse : NSObject, NSCoding{

    var measure : Measure!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        if let measureData = dictionary["measure"] as? [String:Any]{
            measure = Measure(fromDictionary: measureData)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if measure != nil{
            dictionary["measure"] = measure.toDictionary()
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        measure = aDecoder.decodeObject(forKey: "measure") as? Measure
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if measure != nil{
            aCoder.encode(measure, forKey: "measure")
        }
    }
}
