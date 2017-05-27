//
//  BaseAPI.swift
//  UOL
//
//  Created by Hildequias Silas dos Santos Junior on 27/05/17.
//  Copyright © 2017 Hildequias. All rights reserved.
//

import UIKit

class BaseAPI: NSObject {

    let API_PATH: String = "https://api.punkapi.com/"
    let API_VERSION: String = "v2/"
    
    func getURL(_ urlSufix: String) -> String {
        
        let url: String = self.API_PATH + API_VERSION + urlSufix
        return url
    }
    
    func getBeersUrl(_ page: Int) -> String {
        return self.getURL("beers?page=\(page)&per_page=15")
    }
    
    func getSingleBeerUrl(_ id: Int) -> String {
        return self.getURL("beers/\(id)")
    }
}
