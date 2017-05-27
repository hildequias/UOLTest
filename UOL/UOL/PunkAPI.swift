//
//  PunkAPI.swift
//  UOL
//
//  Created by Hildequias Silas dos Santos Junior on 27/05/17.
//  Copyright © 2017 Hildequias. All rights reserved.
//

import UIKit

class PunkAPI: HttpService {

    let baseAPI = BaseAPI()
    let json = BeerJson()
    
    // MARK: - Methods Services
    func getBeers (page:Int, completion: (([Beer]) -> Void)!) {
        
        self.doGet(url: (baseAPI.getBeersUrl(page))) { (data) in
            
            var beers = [Beer]()
            beers = self.json.getBeersFromJson(data)
                
            completion(beers)
        }
    }
    
    func getSingleBeer (id: Int, completion: ((Beer) -> Void)!) {
        
        self.doGet(url: (baseAPI.getSingleBeerUrl(id))) { (data) in
            
            var beer = Beer()
            beer = self.json.getSingleBeerFromJson(data)
            
            completion(beer)
        }
    }
}
