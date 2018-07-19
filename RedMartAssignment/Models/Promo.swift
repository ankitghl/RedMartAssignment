//
//  Promo.swift
//  Created on July 9, 2018

import Foundation


class Promo : NSObject, NSCoding{

    var promoPrice : Float!
    var savings : Float!
    var savingsAmount : Float!
    var savingsText : String!
    var savingsType : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        promoPrice = dictionary["promo_price"] as? Float
        savings = dictionary["savings"] as? Float
        savingsAmount = dictionary["savings_amount"] as? Float
        savingsText = dictionary["savings_text"] as? String
        savingsType = dictionary["savings_type"] as? Int
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if promoPrice != nil{
            dictionary["promo_price"] = promoPrice
        }
        if savings != nil{
            dictionary["savings"] = savings
        }
        if savingsAmount != nil{
            dictionary["savings_amount"] = savingsAmount
        }
        if savingsText != nil{
            dictionary["savings_text"] = savingsText
        }
        if savingsType != nil{
            dictionary["savings_type"] = savingsType
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        promoPrice = aDecoder.decodeObject(forKey: "promo_price") as? Float
        savings = aDecoder.decodeObject(forKey: "savings") as? Float
        savingsAmount = aDecoder.decodeObject(forKey: "savings_amount") as? Float
        savingsText = aDecoder.decodeObject(forKey: "savings_text") as? String
        savingsType = aDecoder.decodeObject(forKey: "savings_type") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if promoPrice != nil{
            aCoder.encode(promoPrice, forKey: "promo_price")
        }
        if savings != nil{
            aCoder.encode(savings, forKey: "savings")
        }
        if savingsAmount != nil{
            aCoder.encode(savingsAmount, forKey: "savings_amount")
        }
        if savingsText != nil{
            aCoder.encode(savingsText, forKey: "savings_text")
        }
        if savingsType != nil{
            aCoder.encode(savingsType, forKey: "savings_type")
        }
    }
}
