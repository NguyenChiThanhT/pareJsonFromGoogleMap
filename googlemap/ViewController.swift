//
//  ViewController.swift
//  googlemap
//
//  Created by NGUYEN CHI THANH on 3/25/19.
//  Copyright © 2019 NGUYEN CHI THANH. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet weak var txtSeach: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       txtSeach.delegate = self
//        gegt(txt: "hochiminh")
    }
    
    func gegt(txt:String) {
        let todoEndpoint: String = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(txt)&key=AIzaSyAzo0QZvt1Khb6J58W3aO0i64zDF7ipiHA"
        
        Alamofire.request(todoEndpoint, method: .get)
            .response { response in
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let tweetRequest = try decoder.decode(GooglePlacesResponse.self, from: data)
                    print(tweetRequest)
                    print(tweetRequest.results.first?.name ?? "null")
                } catch let error {
                    print(error)
                   
                }
                
//                switch response.result{
//                case .success:
//                    do {
//                        let decoder = JSONDecoder()
//                        let tweetRequest = try decoder.decode(GooglePlacesResponse.self, from: response.data!)
//
//                    } catch let error {
//                        print(error)
//                    }
//                    //example if there is an id
////                    let userId = response.objectForKey("id")!
//
//                case .failure(let error):
//                    print("Request failed with error: \(error)")
//
//                }
//                guard let json = response.result.value as? [String: Any] else {
//                    print("didn't get todo object as JSON from API")
//                    print("Error: \(response.result.error)")
//                    return
//                }
//                if let weatherArray = json["results"] as? [[String:Any]],
//                    let weather = weatherArray.first {
//                    print(weather) // the value is an optional.
//                }
//                if let objJson = response.result.value as! NSArray? {
//                    for element in objJson {
//                        let data = element as! NSDictionary
//                        if let arraySchedule = data["results"] as! NSArray? {
//                            print(arraySchedule)
//                        }
//                    }
//                }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let strget:String = textField.text!
        let newstr = strget.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: " ", with: "+")
        gegt(txt: newstr)
        return true
    }
    
    func searchPlaceFromGoogle(place:String) {
        
        var strGoolgeApi = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(place)&key=AIzaSyAzo0QZvt1Khb6J58W3aO0i64zDF7ipiHA"
        strGoolgeApi = strGoolgeApi.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        var urlRequest = URLRequest(url: URL(string: strGoolgeApi)!)
        urlRequest.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            if error == nil {
                
                if let responseData = data{
                   let jsonDicy = try? JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                     print(jsonDicy!)
                   if let dict = jsonDicy as? Dictionary<String, AnyObject> {
                      if let allResults = dict["results"] as? [[String: AnyObject]]{
                        let allResults = allResults[0]
//                        print(allResults)
//                        guard
//                            let geometry = allResults["geometry"] as? [String:AnyObject],
//                            let location = geometry["location"] as? [String:Double],
//                            let lat = location["lat"],
//                            let lng = location["lng"]
//                            else {
//                                //let error = NSError()
//                                return
//                        }
//                        print(location)
                      }
                    }
                }
                
                //                    if let dict = jsonDicy as? Dictionary<String, AnyObject> {
                ////                        if let allResults = dict["results"] as? [Dictionary<String, AnyObject>] {
                ////                            var resultsArray:[Dictionary<String, AnyObject>] = Array()
                
//                if let responseData = data{
//                    let jsonDicy = try? JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
//
////                    if let dict = jsonDicy as? Dictionary<String, AnyObject> {
//////                        if let allResults = dict["results"] as? [Dictionary<String, AnyObject>] {
//////                            var resultsArray:[Dictionary<String, AnyObject>] = Array()
//////
//////                            let geometry = self.lookupAddressResults["geometry"] as Dictionary<NSObject, AnyObject>
//////                        }
//////                        let status = dict["status"] as? String
//////                        if status == "OK" {
//////                            let allResults = dict["results"] as? Array<Dictionary<NSObject, AnyObject>>
//////                            self.lookupAddressResults = allResults![0]
//////
//////                            // Keep the most important values.
//////                            self.fetchedFormattedAddress = self.lookupAddressResults["formatted_address"] as String
//////                            let geometry = self.lookupAddressResults["geometry"] as Dictionary<NSObject, AnyObject>
//////                            self.fetchedAddressLongitude = ((geometry["location"] as Dictionary<NSObject, AnyObject>)["lng"] as NSNumber).doubleValue
//////                            self.fetchedAddressLatitude = ((geometry["location"] as Dictionary<NSObject, AnyObject>)["lat"] as NSNumber).doubleValue
//////
////////                            completionHandler(status: status, success: true)
//////                        }
//////                        else {
////////                            completionHandler(status: status, success: false)
//////                        }
//////                        if let results = dict["results"] as? [Dictionary<String, AnyObject>] {
//////
//////                            var resultsArray:[Dictionary<String, AnyObject>] = Array()
//////                            for dct in results {
//////                                resultsArray.append(dct)
//////                            }
//////                           let place = resultsArray[0]
//////                            if let locationGeometry = place["geometry"] as? Dictionary<String, AnyObject> {
//////                                print(locationGeometry)
//////                            }
//////                        }
////                    }
//                }
            } else {
                
            }
            
        }
        task.resume()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

