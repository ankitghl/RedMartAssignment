//
//  Merchant.swift
//  Created on July 9, 2018

import Foundation


class Merchant : NSObject, NSCoding{

    var subVendorId : Int!
    var subVendorLogo : SubVendorLogo!
    var subVendorName : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        subVendorId = dictionary["sub_vendor_id"] as? Int
        subVendorName = dictionary["sub_vendor_name"] as? String
        if let subVendorLogoData = dictionary["sub_vendor_logo"] as? [String:Any]{
            subVendorLogo = SubVendorLogo(fromDictionary: subVendorLogoData)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if subVendorId != nil{
            dictionary["sub_vendor_id"] = subVendorId
        }
        if subVendorName != nil{
            dictionary["sub_vendor_name"] = subVendorName
        }
        if subVendorLogo != nil{
            dictionary["subVendorLogo"] = subVendorLogo.toDictionary()
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        subVendorId = aDecoder.decodeObject(forKey: "sub_vendor_id") as? Int
        subVendorLogo = aDecoder.decodeObject(forKey: "sub_vendor_logo") as? SubVendorLogo
        subVendorName = aDecoder.decodeObject(forKey: "sub_vendor_name") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if subVendorId != nil{
            aCoder.encode(subVendorId, forKey: "sub_vendor_id")
        }
        if subVendorLogo != nil{
            aCoder.encode(subVendorLogo, forKey: "sub_vendor_logo")
        }
        if subVendorName != nil{
            aCoder.encode(subVendorName, forKey: "sub_vendor_name")
        }
    }
}
