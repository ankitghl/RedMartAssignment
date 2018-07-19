//
//  Inventory.swift
//  Created on July 9, 2018

import Foundation


class Inventory : NSObject, NSCoding{

    var atpLots : [AtpLot]!
    var atpStatus : Int!
    var limitedStockStatus : Int!
    var maxSaleQty : Int!
    var nextAvailableDate : String!
    var qtyInCarts : Int!
    var qtyInStock : Int!
    var stockStatus : Int!
    var stockType : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        atpStatus = dictionary["atp_status"] as? Int
        limitedStockStatus = dictionary["limited_stock_status"] as? Int
        maxSaleQty = dictionary["max_sale_qty"] as? Int
        nextAvailableDate = dictionary["next_available_date"] as? String
        qtyInCarts = dictionary["qty_in_carts"] as? Int
        qtyInStock = dictionary["qty_in_stock"] as? Int
        stockStatus = dictionary["stock_status"] as? Int
        stockType = dictionary["stock_type"] as? Int
        atpLots = [AtpLot]()
        if let atpLotsArray = dictionary["atp_lots"] as? [[String:Any]]{
            for dic in atpLotsArray{
                let value = AtpLot(fromDictionary: dic)
                atpLots.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if atpStatus != nil{
            dictionary["atp_status"] = atpStatus
        }
        if limitedStockStatus != nil{
            dictionary["limited_stock_status"] = limitedStockStatus
        }
        if maxSaleQty != nil{
            dictionary["max_sale_qty"] = maxSaleQty
        }
        if nextAvailableDate != nil{
            dictionary["next_available_date"] = nextAvailableDate
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
        if stockType != nil{
            dictionary["stock_type"] = stockType
        }
        if atpLots != nil{
            var dictionaryElements = [[String:Any]]()
            for atpLotsElement in atpLots {
                dictionaryElements.append(atpLotsElement.toDictionary())
            }
            dictionary["atpLots"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        atpLots = aDecoder.decodeObject(forKey: "atp_lots") as? [AtpLot]
        atpStatus = aDecoder.decodeObject(forKey: "atp_status") as? Int
        limitedStockStatus = aDecoder.decodeObject(forKey: "limited_stock_status") as? Int
        maxSaleQty = aDecoder.decodeObject(forKey: "max_sale_qty") as? Int
        nextAvailableDate = aDecoder.decodeObject(forKey: "next_available_date") as? String
        qtyInCarts = aDecoder.decodeObject(forKey: "qty_in_carts") as? Int
        qtyInStock = aDecoder.decodeObject(forKey: "qty_in_stock") as? Int
        stockStatus = aDecoder.decodeObject(forKey: "stock_status") as? Int
        stockType = aDecoder.decodeObject(forKey: "stock_type") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if atpLots != nil{
            aCoder.encode(atpLots, forKey: "atp_lots")
        }
        if atpStatus != nil{
            aCoder.encode(atpStatus, forKey: "atp_status")
        }
        if limitedStockStatus != nil{
            aCoder.encode(limitedStockStatus, forKey: "limited_stock_status")
        }
        if maxSaleQty != nil{
            aCoder.encode(maxSaleQty, forKey: "max_sale_qty")
        }
        if nextAvailableDate != nil{
            aCoder.encode(nextAvailableDate, forKey: "next_available_date")
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
        if stockType != nil{
            aCoder.encode(stockType, forKey: "stock_type")
        }
    }
}
