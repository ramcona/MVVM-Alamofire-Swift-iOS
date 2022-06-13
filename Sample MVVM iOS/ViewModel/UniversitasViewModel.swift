//
//  UniversitasViewModel.swift
//  Sample MVVM iOS
//
//  Created by Pak Ahmad on 13/06/22.
//

import Foundation
import UIKit
import Alamofire
import ObjectMapper

public class UniversitasViewModel{
        
    //#1 MARK: - properties
    /*
     this property to store data after/before getting a response from the server
     and
     returning with callback
     */
    
    var responseList: [Universitas] = [] {
        didSet{ self.didFinish?() }
    }
    
    var errorMessage: String?{
        didSet{ self.showErrorMessage?() }
    }
    
    var isLoading:Bool = false{
        didSet{ self.statusLoading?() }
    }
    
    
    //#2 MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showErrorMessage: (() -> ())?
    var statusLoading: (() -> ())?
    var didFinish: (() -> ())?
    
    
    //#3 MARK: - network call
    
    //#get list
    func getListUniversitas(){
        //start loading
        self.isLoading = true
        let request = Network.requestGET("search?country=Indonesia")
                
        //request data from network / server
        Alamofire.request(request).responseJSON{ response in
            //finish loading
            self.isLoading = false
            
            //get result from network
            switch response.result {
                
                //success get response from server
                case .success(_):
                
                //extrak data json to list
                let listUniv = Mapper<Universitas>().mapArray(JSONObject: response.result.value)
                self.responseList = listUniv ?? [Universitas]()
                
                break
                
                //failed get response from server
                case .failure(let error):
                    print("error : \(error)")
                    self.errorMessage = "Terjadi kesalahan saat memproses, coba beberapa saat lagi"
                    break
           }
        }
    }
    
    
    //#4 MARK: - UI Logical
    /*
     all function logic for ui write bellow
     */
}
