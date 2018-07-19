//
//  ProductLife.swift
//  Created on July 9, 2018

import Foundation


class ProductLife : NSObject, NSCoding{

    var isMinimum : Bool!
    var metric : String!
    var time : Int!
    var timeIncludingDelivery : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        isMinimum = dictionary["is_minimum"] as? Bool
        metric = dictionary["metric"] as? String
        time = dictionary["time"] as? Int
        timeIncludingDelivery = dictionary["time_including_delivery"] as? Int
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if isMinimum != nil{
            dictionary["is_minimum"] = isMinimum
        }
        if metric != nil{
            dictionary["metric"] = metric
        }
        if time != nil{
            dictionary["time"] = time
        }
        if timeIncludingDelivery != nil{
            dictionary["time_including_delivery"] = timeIncludingDelivery
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        isMinimum = aDecoder.decodeObject(forKey: "is_minimum") as? Bool
        metric = aDecoder.decodeObject(forKey: "metric") as? String
        time = aDecoder.decodeObject(forKey: "time") as? Int
        timeIncludingDelivery = aDecoder.decodeObject(forKey: "time_including_delivery") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if isMinimum != nil{
            aCoder.encode(isMinimum, forKey: "is_minimum")
        }
        if metric != nil{
            aCoder.encode(metric, forKey: "metric")
        }
        if time != nil{
            aCoder.encode(time, forKey: "time")
        }
        if timeIncludingDelivery != nil{
            aCoder.encode(timeIncludingDelivery, forKey: "time_including_delivery")
        }
    }
}
