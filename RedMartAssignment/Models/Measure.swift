//
//  Measure.swift
//  Created on July 9, 2018

import Foundation


class Measure : NSObject, NSCoding{

    var size : Int!
    var wtOrVol : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        size = dictionary["size"] as? Int
        wtOrVol = dictionary["wt_or_vol"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if size != nil{
            dictionary["size"] = size
        }
        if wtOrVol != nil{
            dictionary["wt_or_vol"] = wtOrVol
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        size = aDecoder.decodeObject(forKey: "size") as? Int
        wtOrVol = aDecoder.decodeObject(forKey: "wt_or_vol") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if size != nil{
            aCoder.encode(size, forKey: "size")
        }
        if wtOrVol != nil{
            aCoder.encode(wtOrVol, forKey: "wt_or_vol")
        }
    }
}
