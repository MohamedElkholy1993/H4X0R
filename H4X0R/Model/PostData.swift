//
//  PostData.swift
//  H4X0R
//
//  Created by moutaz hegazy on 4/22/21.
//  Copyright © 2021 Mohmaed_Elkholy. All rights reserved.
//

import Foundation

struct Results: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    let objectID: String
    var id: String{
        return objectID
    }
    let title: String
    let url: String?
    let points: Int
}
