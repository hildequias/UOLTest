//
//  Beer.swift
//  UOL
//
//  Created by Hildequias Silas dos Santos Junior on 27/05/17.
//  Copyright © 2017 Hildequias. All rights reserved.
//

import UIKit

class Beer: NSObject {
    
    static let ID = "id"
    static let NAME = "name"
    static let TAGLINE = "tagline"
    static let FIRST_BREWED = "first_brewed"
    static let DESC = "description"
    static let IMAGE_URL = "image_url"
    static let ABV = "abv"
    static let IBU = "ibu"
    static let TARGET_FG = "target_fg"
    static let TARGET_OG = "target_og"
    static let EBC = "ebc"
    static let SRM = "srm"
    static let PH = "ph"
    static let ATTENUATION_LEVEL = "attenuation_level"
    
    var Id: Int = 0
    var Name: String?
    var Tagline: String?
    var FirstBrewed: String?
    var Desc: String?
    var ImageUrl: String?
    var Abv: Float = 0.0
    var Ibu: Int = 0
    var TargetFg: Int = 0
    var TargetOg: Int = 0
    var Ebc: Int = 0
    var Srm: Int = 0
    var Ph: Float = 0.0
    var AttenuationLevel: Int = 0
}
