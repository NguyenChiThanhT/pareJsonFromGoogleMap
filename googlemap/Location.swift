//
//  Location.swift
//  googlemap
//
//  Created by NGUYEN CHI THANH on 3/25/19.
//  Copyright © 2019 NGUYEN CHI THANH. All rights reserved.
//

import Foundation
struct Location: Codable {
    var lat: Double
    var long: Double
    var icon: String?
    var id: String?
    var name: String
    var openNow: Bool?
    var photos: [PhotoInfo]
    var placeID: String?
    var priceLevel: Int?
    var rating: Double?
    var types: [String]?
    
    init?(json: [String: Any]) {
        guard let lat = json["lat"] as? Double,
            let long = json["lng"] as? Double,
            let icon = json["icon"] as? String,
            let id = json["id"] as? String,
            let name = json["name"] as? String,
            let openNow = json["open_now"] as? Bool,
            let photos = json["photos"] as? [PhotoInfo],
            let placeID = json ["place_id"] as? String,
            let priceLevel = json["price_level"] as? Int,
            let rating = json["rating"] as? Double,
            let types = json["types"] as? [String]? else {
                return nil
        }
        
        self.lat = lat
        self.long = long
        self.icon = icon
        self.id = id
        self.name = name
        self.openNow = openNow
        self.photos = photos
        self.placeID = placeID
        self.priceLevel = priceLevel
        self.rating = rating
        self.types = types
    }
}

struct PhotoInfo : Codable {
    
    let height : Int
    let width : Int
    let photoReference : String
    
    enum CodingKeys : String, CodingKey {
        case height = "height"
        case width = "width"
        case photoReference = "photo_reference"
    }
}
