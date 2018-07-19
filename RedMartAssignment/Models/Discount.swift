//
//  Discount.swift
//  Created on July 9, 2018

import Foundation


class Discount : NSObject, NSCoding{

    var promo : Promo!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        if let promoData = dictionary["promo"] as? [String:Any]{
            promo = Promo(fromDictionary: promoData)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if promo != nil{
            dictionary["promo"] = promo.toDictionary()
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        promo = aDecoder.decodeObject(forKey: "promo") as? Promo
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if promo != nil{
            aCoder.encode(promo, forKey: "promo")
        }
    }
}
