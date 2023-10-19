//
//  Album.swift
//  07_08_2023_WebServices_JSONDecoderDemo
//
//  Created by Vishal Jagtap on 19/10/23.
//

import Foundation
struct Album : Decodable{
    var userid : Int
    var id : Int
    var title : String
    
    private enum CodingKeys : String, CodingKey{
        case userid = "userId", id, title
    }
}
