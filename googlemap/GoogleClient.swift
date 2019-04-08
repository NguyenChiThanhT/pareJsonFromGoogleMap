//
//  GoogleClient.swift
//  googlemap
//
//  Created by NGUYEN CHI THANH on 3/25/19.
//  Copyright © 2019 NGUYEN CHI THANH. All rights reserved.
//

import Foundation

protocol GoogleClientRequest {
    var googlePlacesKey : String { get set }
    func getGooglePlacesData(forKeyword place: String,withinMeters radius: Int, using completionHandler: @escaping (GooglePlacesResponse) -> ())
}

class GoogleClient: GoogleClientRequest {
    
    let session = URLSession(configuration: .default)
    var googlePlacesKey: String = "AIzaSyAzo0QZvt1Khb6J58W3aO0i64zDF7ipiHA"
    
    func getGooglePlacesData( forKeyword place: String, withinMeters radius: Int, using completionHandler: @escaping (GooglePlacesResponse) -> ())  {
        
        var strGoolgeApi = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(place)&key=AIzaSyAzo0QZvt1Khb6J58W3aO0i64zDF7ipiHA"
        strGoolgeApi = strGoolgeApi.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        var urlRequest = URLRequest(url: URL(string: strGoolgeApi)!)
        urlRequest.httpMethod = "GET"
        
        let task = session.dataTask(with: urlRequest) { (responseData, _, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = responseData, let response = try? JSONDecoder().decode(GooglePlacesResponse.self, from: data) else {
//                completionHandler(GooglePlacesResponse(results:[]))
                return
            }
            completionHandler(response)
        }
        task.resume()
    }
    
    
}
