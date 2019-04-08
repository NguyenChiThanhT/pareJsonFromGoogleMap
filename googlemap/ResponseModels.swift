//
//  ResponseModels.swift
//  googlemap
//
//  Created by NGUYEN CHI THANH on 3/25/19.
//  Copyright © 2019 NGUYEN CHI THANH. All rights reserved.
//

import Foundation

struct GooglePlacesResponse : Codable {
    let html_attributions: [String]
    let results : [Place]
    let status:String
}

struct Place : Codable {
    let formatted_address: String
    let geometry : Location 
    let icon : String
    let id : String
    let name : String
    let photos : [PhotoInfo]
    let place_id: String
    let reference: String
    let types : [String]
    
    
    struct Location : Codable {
        
        let location : LatLong
        let viewport : PortView
        
        struct LatLong: Codable {
            
            let lat : Double
            let lng : Double
            
        }
        
        struct PortView : Codable{
            let northeast:NorTheast
            let southwest:SouThest
            
            struct NorTheast:Codable {
                let lat:Double
                let lng:Double
            }
            
            struct SouThest:Codable {
                let lat:Double
                let lng:Double
            }
        }
        
    }
    
    
    
    struct PhotoInfo : Codable {
        
        let height : Int
        let html_attributions:[String]
        let width : Int
        let photo_reference : String
   
    }
}
