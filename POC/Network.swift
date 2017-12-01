//
//  Network.swift
//  POC
//
//  Created by RNTBCI45 on 01/12/17.
//  Copyright © 2017 RNTBCI45. All rights reserved.
//

import UIKit

class Network {
    var suggestions: [String]? = nil
    
    public func getPlaces(_ searchString: String) {
        
        let requestString = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(searchString)&key=AIzaSyDnNqToNW7pV2o9IPY9Rp_8z89FmNnVykU&types=address"
        if let url: URL = URL(string: requestString) {
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let data = data {
                    guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                        return
                    }
                    
                    if let dictionary = json as? [String: Any] {
                        if let predictions: [Any] = dictionary["predictions"] as? Array {
                            self.suggestions = predictions.flatMap() {value -> String in
                                let value = value as! [String: Any]
                                return value["description"] as! String
                            }
                        }
                    }
                }
                print(self.suggestions)
            }
            task.resume()
        }
    }
}

