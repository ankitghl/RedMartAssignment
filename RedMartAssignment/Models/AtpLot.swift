//
//  AtpLot.swift
//  Created on July 9, 2018

import Foundation


class AtpLot : NSObject, NSCoding{

    var fromDate : String!
    var qtyInCarts : Int!
    var qtyInStock : Int!
    var stockStatus : Int!
    var toDate : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        fromDate = dictionary["from_date"] as? String
        qtyInCarts = dictionary["qty_in_carts"] as? Int
        qtyInStock = dictionary["qty_in_stock"] as? Int
        stockStatus = dictionary["stock_status"] as? Int
        toDate = dictionary["to_date"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if fromDate != nil{
            dictionary["from_date"] = fromDate
        }
        if qtyInCarts != nil{
            dictionary["qty_in_carts"] = qtyInCarts
        }
        if qtyInStock != nil{
            dictionary["qty_in_stock"] = qtyInStock
        }
        if stockStatus != nil{
            dictionary["stock_status"] = stockStatus
        }
        if toDate != nil{
            dictionary["to_date"] = toDate
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        fromDate = aDecoder.decodeObject(forKey: "from_date") as? String
        qtyInCarts = aDecoder.decodeObject(forKey: "qty_in_carts") as? Int
        qtyInStock = aDecoder.decodeObject(forKey: "qty_in_stock") as? Int
        stockStatus = aDecoder.decodeObject(forKey: "stock_status") as? Int
        toDate = aDecoder.decodeObject(forKey: "to_date") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if fromDate != nil{
            aCoder.encode(fromDate, forKey: "from_date")
        }
        if qtyInCarts != nil{
            aCoder.encode(qtyInCarts, forKey: "qty_in_carts")
        }
        if qtyInStock != nil{
            aCoder.encode(qtyInStock, forKey: "qty_in_stock")
        }
        if stockStatus != nil{
            aCoder.encode(stockStatus, forKey: "stock_status")
        }
        if toDate != nil{
            aCoder.encode(toDate, forKey: "to_date")
        }
    }
}
