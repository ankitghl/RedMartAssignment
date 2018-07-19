//
//  Store.swift
//  Created on July 9, 2018

import Foundation


class Store : NSObject, NSCoding{

    var desc : String!
    var id : Int!
    var mediaAssets : MediaAsset!
    var name : String!
    var storeType : String!
    var uri : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        desc = dictionary["desc"] as? String
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        storeType = dictionary["store_type"] as? String
        uri = dictionary["uri"] as? String
        if let mediaAssetsData = dictionary["media_assets"] as? [String:Any]{
            mediaAssets = MediaAsset(fromDictionary: mediaAssetsData)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if desc != nil{
            dictionary["desc"] = desc
        }
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if storeType != nil{
            dictionary["store_type"] = storeType
        }
        if uri != nil{
            dictionary["uri"] = uri
        }
        if mediaAssets != nil{
            dictionary["mediaAssets"] = mediaAssets.toDictionary()
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        desc = aDecoder.decodeObject(forKey: "desc") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        mediaAssets = aDecoder.decodeObject(forKey: "media_assets") as? MediaAsset
        name = aDecoder.decodeObject(forKey: "name") as? String
        storeType = aDecoder.decodeObject(forKey: "store_type") as? String
        uri = aDecoder.decodeObject(forKey: "uri") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if desc != nil{
            aCoder.encode(desc, forKey: "desc")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if mediaAssets != nil{
            aCoder.encode(mediaAssets, forKey: "media_assets")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if storeType != nil{
            aCoder.encode(storeType, forKey: "store_type")
        }
        if uri != nil{
            aCoder.encode(uri, forKey: "uri")
        }
    }
}
