//
//  HttpService.swift
//  UOL
//
//  Created by Hildequias Silas dos Santos Junior on 27/05/17.
//  Copyright © 2017 Hildequias. All rights reserved.
//

import UIKit
import Alamofire

open class HttpService: NSObject {
    
    let auth = ""
    
    // MARK: - Method GET
    func doGet(url: String, completion: ((Data) -> Void)!) {
        
        let headers: HTTPHeaders = [
            "Authorization": auth,
            "Accept": "application/json",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        Alamofire.request(url, method: .get, headers: headers).responseData { response in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            debugPrint(response.request!)  // original URL request
            debugPrint(response.response!) // HTTP URL response
            debugPrint(response.data!)     // server data
            debugPrint(response.result)    // result of response serialization
            
            var result = Data()
            
            if let data = response.result.value, let utf8Text = String(data: data, encoding: .utf8) {
                debugPrint("Data: \(utf8Text)")
                result = data
            }
            
            completion(result)
        }
    }
    
    // MARK: - Method POST
    func doPost(url: String, parameters: Parameters, completion: ((Data) -> Void)!) {
        
        let headers: HTTPHeaders = [
            "Authorization": auth,
            "Accept": "application/json",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        Alamofire.request(url, method: .post, parameters: parameters, headers: headers).responseData { response in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            debugPrint(response.request!)  // original URL request
            debugPrint(response.response!) // HTTP URL response
            debugPrint(response.data!)     // server data
            debugPrint(response.result)    // result of response serialization
            
            var result = Data()
            
            if let data = response.result.value, let utf8Text = String(data: data, encoding: .utf8) {
                debugPrint("Data: \(utf8Text)")
                result = data
            }
            
            completion(result)
        }
    }
    
    // MARK: - Method DELETE
    func doDelete(url: String, completion: ((Data) -> Void)!) {
        
        let headers: HTTPHeaders = [
            "Authorization": auth,
            "Accept": "application/json",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        Alamofire.request(url, method: .delete, headers: headers).responseData { response in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            debugPrint(response.request!)  // original URL request
            debugPrint(response.response!) // HTTP URL response
            debugPrint(response.data!)     // server data
            debugPrint(response.result)    // result of response serialization
            
            var result = Data()
            
            if let data = response.result.value, let utf8Text = String(data: data, encoding: .utf8) {
                debugPrint("Data: \(utf8Text)")
                result = data
            }
            
            completion(result)
        }
    }
}
