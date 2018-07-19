//
//  Promotion.swift
//  Created on July 9, 2018

import Foundation


class Promotion : NSObject, NSCoding{

    var currentProductGroupId : Int!
    var id : Int!
    var promoLabel : String!
    var savingsText : String!
    var type : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        currentProductGroupId = dictionary["current_product_group_id"] as? Int
        id = dictionary["id"] as? Int
        promoLabel = dictionary["promo_label"] as? String
        savingsText = dictionary["savings_text"] as? String
        type = dictionary["type"] as? Int
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if currentProductGroupId != nil{
            dictionary["current_product_group_id"] = currentProductGroupId
        }
        if id != nil{
            dictionary["id"] = id
        }
        if promoLabel != nil{
            dictionary["promo_label"] = promoLabel
        }
        if savingsText != nil{
            dictionary["savings_text"] = savingsText
        }
        if type != nil{
            dictionary["type"] = type
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        currentProductGroupId = aDecoder.decodeObject(forKey: "current_product_group_id") as? Int
        id = aDecoder.decodeObject(forKey: "id") as? Int
        promoLabel = aDecoder.decodeObject(forKey: "promo_label") as? String
        savingsText = aDecoder.decodeObject(forKey: "savings_text") as? String
        type = aDecoder.decodeObject(forKey: "type") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if currentProductGroupId != nil{
            aCoder.encode(currentProductGroupId, forKey: "current_product_group_id")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if promoLabel != nil{
            aCoder.encode(promoLabel, forKey: "promo_label")
        }
        if savingsText != nil{
            aCoder.encode(savingsText, forKey: "savings_text")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
    }
}
