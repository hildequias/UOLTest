//
//  BeerJson.swift
//  UOL
//
//  Created by Hildequias Silas dos Santos Junior on 27/05/17.
//  Copyright © 2017 Hildequias. All rights reserved.
//

import UIKit

class BeerJson: NSObject {

    func getBeersFromJson(_ data: Data) -> [Beer] {
        
        var beers: [Beer] = []
        
        do {
        
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [Dictionary<String, Any>]
            
            for beerItem in json! {
                
                let beer: Beer = Beer()
                
                if let idBeer = beerItem[Beer.ID] as? Int {
                    beer.Id = idBeer
                }
                if let name = beerItem[Beer.NAME] as? String {
                    beer.Name = name
                }
                if let abv = beerItem[Beer.ABV] as? Float {
                    beer.Abv = abv
                }
                if let imageUrl = beerItem[Beer.IMAGE_URL] as? String {
                    beer.ImageUrl = imageUrl
                }
                
                beers.append(beer)
            }
            
        } catch let error as NSError {
            debugPrint(error)
        }
        
        return beers
    }
    
    func getSingleBeerFromJson(_ data: Data) -> Beer {
        
        let beer: Beer = Beer()
        
        do {
            
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [Dictionary<String, Any>]
            
            for beerItem in json! {
                
                if let idBeer = beerItem[Beer.ID] as? Int {
                    beer.Id = idBeer
                }
                if let name = beerItem[Beer.NAME] as? String {
                    beer.Name = name
                }
                if let imageUrl = beerItem[Beer.IMAGE_URL] as? String {
                    beer.ImageUrl = imageUrl
                }
                if let tagline = beerItem[Beer.TAGLINE] as? String {
                    beer.Tagline = tagline
                }
                if let abv = beerItem[Beer.ABV] as? Float {
                    beer.Abv = abv
                }
                if let ibu = beerItem[Beer.IBU] as? Int {
                    beer.Ibu = ibu
                }
                if let desc = beerItem[Beer.DESC] as? String {
                    beer.Desc = desc
                }
            }
        } catch let error as NSError {
            debugPrint(error)
        }
        
        return beer
    }
    
}
