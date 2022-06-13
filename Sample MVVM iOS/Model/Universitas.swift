//
//  Universitas.swift
//  Sample MVVM iOS
//
//  Created by Pak Ahmad on 13/06/22.
//

import Foundation
import ObjectMapper

public class Universitas: Mappable{
    
    public required init?(map: Map) {
    
    }
    
    public init(){
        
    }
    
    public func mapping(map: Map) {
        web_pages <- map["web_pages"]
        name <- map["name"]
        country <- map["country"]
        alpha_two_code <- map["alpha_two_code"]
        domains <- map["domains"]
        web_pages <- map["web_pages"]
    }
    
    public var name:String = ""
    public var country:String = ""
    public var alpha_two_code:String = ""
    public var domains:[String] = [String]()
    public var web_pages:[String] = [String]()
    
    
}

