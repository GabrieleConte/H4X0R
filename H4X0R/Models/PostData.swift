//
//  PostData.swift
//  H4X0R
//
//  Created by Gabriele Conte on 03/11/22.
//

import Foundation
struct Results:Decodable{
    let hits: [Post]
}

struct Post:Decodable,Identifiable{
    var id:String{
        return objectID
    }
    let objectID:String
    let points:Int
    let title: String
    let url: String
}
