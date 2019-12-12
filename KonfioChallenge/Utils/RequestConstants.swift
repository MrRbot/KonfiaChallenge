//
//  Constants.swift
//
//  Created by Javier on 11/12/19.
//  Copyright © 2019 MrRobot. All rights reserved.
//

import Foundation

struct K {
    struct Server {
        static let baseURL = "https://api.myjson.com/bins/"
        static let imgResourceURL = "https://cdn.flickeringmyth.com/wp-content/uploads/2018/03/"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}


