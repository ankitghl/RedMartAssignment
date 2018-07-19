//
//  Product.swift
//  Created on July 9, 2018

import Foundation


class Product : NSObject, NSCoding{

    var attributes : Attribute!
    var categories : [Int]!
    var categoryTags : [String]!
    var desc : String!
    var descriptionFields : DescriptionField!
    var details : Detail!
    var filters : Filter!
    var id : Int!
    var images : [Image]!
    var img : Img!
    var inventory : Inventory!
    var labels : [String]!
    var measure : Measure!
    var merchant : Merchant!
    var pr : Int!
    var pricing : Pricing!
    var productLife : ProductLife!
    var promotions : [Promotion]!
    var sku : String!
    var store : Store!
    var title : String!
    var types : [Int]!
    var warehouse : Warehouse!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        desc = dictionary["desc"] as? String
        id = dictionary["id"] as? Int
        pr = dictionary["pr"] as? Int
        sku = dictionary["sku"] as? String
        title = dictionary["title"] as? String
        if let attributesData = dictionary["attributes"] as? [String:Any]{
            attributes = Attribute(fromDictionary: attributesData)
        }
        if let descriptionFieldsData = dictionary["description_fields"] as? [String:Any]{
            descriptionFields = DescriptionField(fromDictionary: descriptionFieldsData)
        }
        if let detailsData = dictionary["details"] as? [String:Any]{
            details = Detail(fromDictionary: detailsData)
        }
        if let filtersData = dictionary["filters"] as? [String:Any]{
            filters = Filter(fromDictionary: filtersData)
        }
        if let imgData = dictionary["img"] as? [String:Any]{
            img = Img(fromDictionary: imgData)
        }
        if let inventoryData = dictionary["inventory"] as? [String:Any]{
            inventory = Inventory(fromDictionary: inventoryData)
        }
        if let measureData = dictionary["measure"] as? [String:Any]{
            measure = Measure(fromDictionary: measureData)
        }
        if let merchantData = dictionary["merchant"] as? [String:Any]{
            merchant = Merchant(fromDictionary: merchantData)
        }
        if let pricingData = dictionary["pricing"] as? [String:Any]{
            pricing = Pricing(fromDictionary: pricingData)
        }
        if let productLifeData = dictionary["product_life"] as? [String:Any]{
            productLife = ProductLife(fromDictionary: productLifeData)
        }
        if let storeData = dictionary["store"] as? [String:Any]{
            store = Store(fromDictionary: storeData)
        }
        if let warehouseData = dictionary["warehouse"] as? [String:Any]{
            warehouse = Warehouse(fromDictionary: warehouseData)
        }
        images = [Image]()
        if let imagesArray = dictionary["images"] as? [[String:Any]]{
            for dic in imagesArray{
                let value = Image(fromDictionary: dic)
                images.append(value)
            }
        }
        promotions = [Promotion]()
        if let promotionsArray = dictionary["promotions"] as? [[String:Any]]{
            for dic in promotionsArray{
                let value = Promotion(fromDictionary: dic)
                promotions.append(value)
            }
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
        if pr != nil{
            dictionary["pr"] = pr
        }
        if sku != nil{
            dictionary["sku"] = sku
        }
        if title != nil{
            dictionary["title"] = title
        }
        if attributes != nil{
            dictionary["attributes"] = attributes.toDictionary()
        }
        if descriptionFields != nil{
            dictionary["descriptionFields"] = descriptionFields.toDictionary()
        }
        if details != nil{
            dictionary["details"] = details.toDictionary()
        }
        if filters != nil{
            dictionary["filters"] = filters.toDictionary()
        }
        if img != nil{
            dictionary["img"] = img.toDictionary()
        }
        if inventory != nil{
            dictionary["inventory"] = inventory.toDictionary()
        }
        if measure != nil{
            dictionary["measure"] = measure.toDictionary()
        }
        if merchant != nil{
            dictionary["merchant"] = merchant.toDictionary()
        }
        if pricing != nil{
            dictionary["pricing"] = pricing.toDictionary()
        }
        if productLife != nil{
            dictionary["productLife"] = productLife.toDictionary()
        }
        if store != nil{
            dictionary["store"] = store.toDictionary()
        }
        if warehouse != nil{
            dictionary["warehouse"] = warehouse.toDictionary()
        }
        if images != nil{
            var dictionaryElements = [[String:Any]]()
            for imagesElement in images {
                dictionaryElements.append(imagesElement.toDictionary())
            }
            dictionary["images"] = dictionaryElements
        }
        if promotions != nil{
            var dictionaryElements = [[String:Any]]()
            for promotionsElement in promotions {
                dictionaryElements.append(promotionsElement.toDictionary())
            }
            dictionary["promotions"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        attributes = aDecoder.decodeObject(forKey: "attributes") as? Attribute
        categories = aDecoder.decodeObject(forKey: "categories") as? [Int]
        categoryTags = aDecoder.decodeObject(forKey: "category_tags") as? [String]
        desc = aDecoder.decodeObject(forKey: "desc") as? String
        descriptionFields = aDecoder.decodeObject(forKey: "description_fields") as? DescriptionField
        details = aDecoder.decodeObject(forKey: "details") as? Detail
        filters = aDecoder.decodeObject(forKey: "filters") as? Filter
        id = aDecoder.decodeObject(forKey: "id") as? Int
        images = aDecoder.decodeObject(forKey: "images") as? [Image]
        img = aDecoder.decodeObject(forKey: "img") as? Img
        inventory = aDecoder.decodeObject(forKey: "inventory") as? Inventory
        labels = aDecoder.decodeObject(forKey: "labels") as? [String]
        measure = aDecoder.decodeObject(forKey: "measure") as? Measure
        merchant = aDecoder.decodeObject(forKey: "merchant") as? Merchant
        pr = aDecoder.decodeObject(forKey: "pr") as? Int
        pricing = aDecoder.decodeObject(forKey: "pricing") as? Pricing
        productLife = aDecoder.decodeObject(forKey: "product_life") as? ProductLife
        promotions = aDecoder.decodeObject(forKey: "promotions") as? [Promotion]
        sku = aDecoder.decodeObject(forKey: "sku") as? String
        store = aDecoder.decodeObject(forKey: "store") as? Store
        title = aDecoder.decodeObject(forKey: "title") as? String
        types = aDecoder.decodeObject(forKey: "types") as? [Int]
        warehouse = aDecoder.decodeObject(forKey: "warehouse") as? Warehouse
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if attributes != nil{
            aCoder.encode(attributes, forKey: "attributes")
        }
        if categories != nil{
            aCoder.encode(categories, forKey: "categories")
        }
        if categoryTags != nil{
            aCoder.encode(categoryTags, forKey: "category_tags")
        }
        if desc != nil{
            aCoder.encode(desc, forKey: "desc")
        }
        if descriptionFields != nil{
            aCoder.encode(descriptionFields, forKey: "description_fields")
        }
        if details != nil{
            aCoder.encode(details, forKey: "details")
        }
        if filters != nil{
            aCoder.encode(filters, forKey: "filters")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if images != nil{
            aCoder.encode(images, forKey: "images")
        }
        if img != nil{
            aCoder.encode(img, forKey: "img")
        }
        if inventory != nil{
            aCoder.encode(inventory, forKey: "inventory")
        }
        if labels != nil{
            aCoder.encode(labels, forKey: "labels")
        }
        if measure != nil{
            aCoder.encode(measure, forKey: "measure")
        }
        if merchant != nil{
            aCoder.encode(merchant, forKey: "merchant")
        }
        if pr != nil{
            aCoder.encode(pr, forKey: "pr")
        }
        if pricing != nil{
            aCoder.encode(pricing, forKey: "pricing")
        }
        if productLife != nil{
            aCoder.encode(productLife, forKey: "product_life")
        }
        if promotions != nil{
            aCoder.encode(promotions, forKey: "promotions")
        }
        if sku != nil{
            aCoder.encode(sku, forKey: "sku")
        }
        if store != nil{
            aCoder.encode(store, forKey: "store")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if types != nil{
            aCoder.encode(types, forKey: "types")
        }
        if warehouse != nil{
            aCoder.encode(warehouse, forKey: "warehouse")
        }
    }
}
