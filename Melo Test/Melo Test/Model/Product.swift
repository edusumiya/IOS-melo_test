//
//  Product.swift
//  Melo Test
//
//  Created by Eduardo Sumiya on 05/04/19.
//  Copyright © 2019 Sumiya. All rights reserved.
//

import Foundation

struct Product: Codable {
    let id, siteID, title: String?
    let subtitle: JSONNull?
    let sellerID: Int?
    let categoryID: String?
    let officialStoreID: Int?
    let price, basePrice: Double?
    let originalPrice: JSONNull?
    let currencyID: String?
    let initialQuantity, availableQuantity, soldQuantity: Int?
    let saleTerms: [JSONAny]?
    let buyingMode, listingTypeID, startTime, stopTime: String?
    let condition: String?
    let permalink: String?
    let thumbnail: String?
    let secureThumbnail: String?
    let pictures: [Picture]?
    let videoID: JSONNull?
    let descriptions: [Description]?
    let acceptsMercadopago: Bool?
    let nonMercadoPagoPaymentMethods: [JSONAny]?
    let shipping: Shipping?
    let internationalDeliveryMode: String?
    let sellerAddress: SellerAddress?
    let sellerContact: JSONNull?
    let location: Location?
    let geolocation: Geolocation?
    let coverageAreas: [JSONAny]?
    let attributes: [Attribute]?
    let warnings: [JSONAny]?
    let listingSource: String?
    let variations: [Variation]?
    let status: String?
    let subStatus: [JSONAny]?
    let tags: [String]?
    let warranty, catalogProductID, domainID: String?
    let parentItemID: JSONNull?
    let dealIDS: [JSONAny]?
    let automaticRelist: Bool?
    let dateCreated, lastUpdated: String?
    let health: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case siteID = "site_id"
        case title, subtitle
        case sellerID = "seller_id"
        case categoryID = "category_id"
        case officialStoreID = "official_store_id"
        case price
        case basePrice = "base_price"
        case originalPrice = "original_price"
        case currencyID = "currency_id"
        case initialQuantity = "initial_quantity"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case saleTerms = "sale_terms"
        case buyingMode = "buying_mode"
        case listingTypeID = "listing_type_id"
        case startTime = "start_time"
        case stopTime = "stop_time"
        case condition, permalink, thumbnail
        case secureThumbnail = "secure_thumbnail"
        case pictures
        case videoID = "video_id"
        case descriptions
        case acceptsMercadopago = "accepts_mercadopago"
        case nonMercadoPagoPaymentMethods = "non_mercado_pago_payment_methods"
        case shipping
        case internationalDeliveryMode = "international_delivery_mode"
        case sellerAddress = "seller_address"
        case sellerContact = "seller_contact"
        case location, geolocation
        case coverageAreas = "coverage_areas"
        case attributes, warnings
        case listingSource = "listing_source"
        case variations, status
        case subStatus = "sub_status"
        case tags, warranty
        case catalogProductID = "catalog_product_id"
        case domainID = "domain_id"
        case parentItemID = "parent_item_id"
        case dealIDS = "deal_ids"
        case automaticRelist = "automatic_relist"
        case dateCreated = "date_created"
        case lastUpdated = "last_updated"
        case health
    }
}

struct Attribute: Codable {
    let id, name: String?
    let valueID, valueName: String?
    let valueStruct: JSONNull?
    let attributeGroupID: AttributeGroupID?
    let attributeGroupName: AttributeGroupName?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
        case valueStruct = "value_struct"
        case attributeGroupID = "attribute_group_id"
        case attributeGroupName = "attribute_group_name"
    }
}

enum AttributeGroupID: String, Codable {
    case others = "OTHERS"
}

enum AttributeGroupName: String, Codable {
    case outros = "Outros"
}

struct Description: Codable {
    let id: String?
}

struct Geolocation: Codable {
    let latitude, longitude: Double?
}

struct Location: Codable {
}

struct Picture: Codable {
    let id: String?
    let url: String?
    let secureURL: String?
    let size, maxSize, quality: String?
    
    enum CodingKeys: String, CodingKey {
        case id, url
        case secureURL = "secure_url"
        case size
        case maxSize = "max_size"
        case quality
    }
}

struct SellerAddress: Codable {
    let comment, addressLine, zipCode: String?
    let city, state, country: City?
    let searchLocation: SearchLocation?

    enum CodingKeys: String, CodingKey {
        case comment
        case addressLine = "address_line"
        case zipCode = "zip_code"
        case city, state, country
        case searchLocation = "search_location"
    }
}

struct City: Codable {
    let id, name: String?
}

struct SearchLocation: Codable {
    let neighborhood, city, state: City?
}

struct Shipping: Codable {
    let mode: String?
    let freeMethods: [FreeMethod]?
    let tags: [String]?
    let dimensions: String?
    let localPickUp, freeShipping: Bool?
    let logisticType: String?
    let storePickUp: Bool?
    
    enum CodingKeys: String, CodingKey {
        case mode
        case freeMethods = "free_methods"
        case tags, dimensions
        case localPickUp = "local_pick_up"
        case freeShipping = "free_shipping"
        case logisticType = "logistic_type"
        case storePickUp = "store_pick_up"
    }
}

struct FreeMethod: Codable {
    let id: Int?
    let rule: Rule?
}

struct Rule: Codable {
    let ruleDefault: Bool?
    let freeMode: String?
    let freeShippingFlag: Bool?
    let value: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case ruleDefault = "default"
        case freeMode = "free_mode"
        case freeShippingFlag = "free_shipping_flag"
        case value
    }
}

struct Variation: Codable {
    let id: Int?
    let price: Double?
    let attributeCombinations: [AttributeCombination]?
    let availableQuantity, soldQuantity: Int?
    let saleTerms: [JSONAny]?
    let pictureIDS: [String]?
    let sellerCustomField: JSONNull?
    let catalogProductID: String?
    
    enum CodingKeys: String, CodingKey {
        case id, price
        case attributeCombinations = "attribute_combinations"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case saleTerms = "sale_terms"
        case pictureIDS = "picture_ids"
        case sellerCustomField = "seller_custom_field"
        case catalogProductID = "catalog_product_id"
    }
}

struct AttributeCombination: Codable {
    let id, name, valueID, valueName: String?
    let valueStruct: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
        case valueStruct = "value_struct"
    }
}

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
