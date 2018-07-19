//
//  Pricing.swift
//  Created on July 9, 2018

import Foundation


class Pricing : NSObject, NSCoding{

    var applicableDiscount : String!
    var discounts : Discount!
    var onSale : Int!
    var price : Float!
    var promoId : Int!
    var promoPrice : Float!
    var savings : Float!
    var savingsAmount : Float!
    var savingsText : String!
    var savingsType : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        applicableDiscount = dictionary["applicable_discount"] as? String
        onSale = dictionary["on_sale"] as? Int
        price = dictionary["price"] as? Float
        promoId = dictionary["promo_id"] as? Int
        promoPrice = dictionary["promo_price"] as? Float
        savings = dictionary["savings"] as? Float
        savingsAmount = dictionary["savings_amount"] as? Float
        savingsText = dictionary["savings_text"] as? String
        savingsType = dictionary["savings_type"] as? Int
        if let discountsData = dictionary["discounts"] as? [String:Any]{
            discounts = Discount(fromDictionary: discountsData)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if applicableDiscount != nil{
            dictionary["applicable_discount"] = applicableDiscount
        }
        if onSale != nil{
            dictionary["on_sale"] = onSale
        }
        if price != nil{
            dictionary["price"] = price
        }
        if promoId != nil{
            dictionary["promo_id"] = promoId
        }
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
        if discounts != nil{
            dictionary["discounts"] = discounts.toDictionary()
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        applicableDiscount = aDecoder.decodeObject(forKey: "applicable_discount") as? String
        discounts = aDecoder.decodeObject(forKey: "discounts") as? Discount
        onSale = aDecoder.decodeObject(forKey: "on_sale") as? Int
        price = aDecoder.decodeObject(forKey: "price") as? Float
        promoId = aDecoder.decodeObject(forKey: "promo_id") as? Int
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
        if applicableDiscount != nil{
            aCoder.encode(applicableDiscount, forKey: "applicable_discount")
        }
        if discounts != nil{
            aCoder.encode(discounts, forKey: "discounts")
        }
        if onSale != nil{
            aCoder.encode(onSale, forKey: "on_sale")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if promoId != nil{
            aCoder.encode(promoId, forKey: "promo_id")
        }
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
