//
//  MediaAsset.swift
//  Created on July 9, 2018

import Foundation


class MediaAsset : NSObject, NSCoding{

    var logo : Logo!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        if let logoData = dictionary["logo"] as? [String:Any]{
            logo = Logo(fromDictionary: logoData)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if logo != nil{
            dictionary["logo"] = logo.toDictionary()
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        logo = aDecoder.decodeObject(forKey: "logo") as? Logo
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if logo != nil{
            aCoder.encode(logo, forKey: "logo")
        }
    }
}
