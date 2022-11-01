//
//  Product.swift
//  DidSelect
//
//  Created by Mac on 12/10/22.
//

import Foundation

struct product:Codable
{
    var id : Int
    var title : String
    var description : String
    var price : Float
    var image : URL
}
