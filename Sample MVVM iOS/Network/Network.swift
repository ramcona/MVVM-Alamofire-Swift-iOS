//
//  Network.swift
//  Sample MVVM iOS
//
//  Created by Pak Ahmad on 13/06/22.
//

import Foundation


public class  Network {
    public static let BASE_URL:String = "http://universities.hipolabs.com/"
    
    public static let APIKEY :String = "e2B1mOrtENsqbFgPOZhC0S9o1mHByEhrQWunZI4kA499rE8JF7bI6QaCwbvF5cvelugegmCN4Lj2Nb7uCAcRrmYK7frjzNMnMjgU"
    
   
    
    public static func getUrlApi(url:String) -> String {
        return "\(BASE_URL)\(url)"
    }
    
   
    //search?country=Indonesia
    public static func requestGET(_ apiname:String) -> URLRequest {
        let url = URL(string: getUrlApi(url:apiname))
        
        var request = URLRequest(url: url!)
        request.setValue("application/json",forHTTPHeaderField: "Content-Type")
        request.setValue("application/json",forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        

        return request
    }

    
    
}
